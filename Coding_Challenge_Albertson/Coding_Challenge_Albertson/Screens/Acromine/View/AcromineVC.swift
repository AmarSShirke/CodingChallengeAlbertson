//
//  AcromineVC.swift
//  Coding_Challenge_Albertson
//
//  Created by Amar Shirke on 25/01/23.
//

import UIKit

class AcromineVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var acromineTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var acromineSearchbar: UISearchBar!
    
    // MARK: - Variables
    var timer: Timer?
    
    private var acromineViewModel = AcromineViewModel()
    
    // MARK: - Page life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initialSetup()
    
    }
    
    func initialSetup()
    {
        hideSpinner()
        observeEvent()
    }

    //MARK: - Data Binding Event
    func observeEvent() {
        
        acromineViewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }
            
            switch event {
            
            case .loading:
                self.showSpinner()
            
            case .stopLoading:
                self.hideSpinner()
            
            case .dataLoaded:
                self.hideSpinner()
                DispatchQueue.main.async {
                    self.acromineTableView.reloadData()
                }
                
            case .error(let errorMsg):
                self.hideSpinner()
                if (errorMsg != nil){
                    DispatchQueue.main.async {
                        self.acromineTableView.reloadData()
                        let alert = UIAlertController(title: errorMsg, message: nil, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(alert, animated: true)
                    }
                }
            
            }
            
        }
        
    }
}

// MARK: - TableView Datasource
extension AcromineVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return acromineViewModel.acromineDataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AcromineTableViewCell", for: indexPath) as! AcromineTableViewCell

        cell.acromineLabel.text = acromineViewModel.acromineDataArray?[indexPath.row].lf ?? ""
        
        return cell
    }
    
}

// MARK: - SearchBar Delegate
extension AcromineVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchText.count > 0{

            timer?.invalidate()

            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
                self.acromineViewModel.getAcromines(lf: "", sf: searchText)
            })
        }else
        {
            hideSpinner()
            acromineViewModel.acromineDataArray = []
            DispatchQueue.main.async {
                self.acromineTableView.reloadData()
            }
        }
    }
}

// MARK: - Activity Indicator
extension AcromineVC {
    
    func showSpinner()
    {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
        }
    }
    
    func hideSpinner()
    {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
}
