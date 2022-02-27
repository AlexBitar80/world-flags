//
//  ViewController.swift
//  ViewFlags
//
//  Created by João Alexandre on 25/02/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "View Flags"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix(".png") {
                pictures.append(item.getFileName())
            }
        }
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row].uppercased()
        cell.textLabel?.textColor = UIColor.white
        cell.imageView?.image = UIImage(named: "\(pictures[indexPath.row])")
        cell.imageView?.layer.borderWidth = 1
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//MARK: - String Extension

extension String {
  func getFileName() -> String {
    return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
  }

  func getFileExtension() -> String {
    return URL(fileURLWithPath: self).pathExtension
  }
}
