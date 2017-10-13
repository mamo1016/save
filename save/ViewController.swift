
//testtest

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet var textField:UITextField!
    @IBOutlet var label:UILabel!
    @IBOutlet var label2:UILabel!

    var testText:String = "default"
    var number: Int!
    
    
    // UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textFiel の情報を受け取るための delegate を設定
        textField.delegate = self
        
        // デフォルト値
        userDefaults.register(defaults: ["DataStore": "default"])
        userDefaults.register(defaults: ["Data": "default2"])
        label.text = readData()
        label2.text = String(readData2())
        
//        if number != nil{
//            number = 1
//        }else{
//            number = saveData
//        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{   //textFieldをUITextFieldとして宣言，　Bool型の値を戻す
        testText = textField.text!
//        dddd
//        cccc
        label.text = testText
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        saveData(str: testText)
        
        return true
    }
    
    func saveData(str: String){
        
        // Keyを指定して保存
        userDefaults.set(str, forKey: "DataStore")
        userDefaults.synchronize()
        print("saveData")

    }
    
    func readData() -> String {
        // Keyを指定して読み込み
        let str: String = userDefaults.object(forKey: "DataStore") as! String
        print("readData")

        return (str)
    }
    
    func readData2() -> Int {
        // Keyを指定して読み込み
        let str2: Int = userDefaults.object(forKey: "Data") as! Int
        
        return (str2)
    }

    
    
    @IBAction func buttonTapped(_ sender : AnyObject) { //クリアボタンの処理
        // Key の値を削除
        userDefaults.removeObject(forKey: "DataStore")
        
        // Keyを指定して読み込み
        let str: String = userDefaults.object(forKey: "DataStore") as! String
        
        label.text = str
    }

    
    @IBAction func plus (){
        if number == nil{
            number = 1
        }else{
            number = number + 1
        }
//        label2.text = String(number)
        
        userDefaults.set(number, forKey: "Data")
        let saveData: Int = userDefaults.object(forKey: "Data") as! Int
        label2.text = String(saveData)
        print(saveData)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
