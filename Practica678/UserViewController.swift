


import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblLat: UILabel!
    @IBOutlet weak var lblLgn: UILabel!
    
    var usuario: Usuario?
    
    var imagePick = UIImagePickerController()
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imagePick.delegate = self
        lblName.text = usuario?.name
        lblEmail.text = usuario?.email
        lblPhone.text = usuario?.phone
        lblLat.text = usuario?.lat.description
        lblLgn.text = usuario?.lng.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func show(_ sender: Any) {
        performSegue(withIdentifier: "Mapx", sender: self)
    }
    
    
    
    @IBAction func agregar_imagen(_ sender: Any)
    {
        imagePick.sourceType = .photoLibrary
        imagePick.allowsEditing = true
        present(imagePick, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! MapViewController
        destination.name = self.usuario?.name
        destination.lat = self.usuario?.lat
        destination.lng = self.usuario?.lng
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension UserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            myImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

