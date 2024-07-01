import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        

        let resultLabel = UILabel()
        resultLabel.text = "12345"
        resultLabel.font = UIFont.boldSystemFont(ofSize: 60)
        resultLabel.backgroundColor = .black
        resultLabel.textColor = .white
        resultLabel.textAlignment = .right
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            resultLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        func createButton(title: String, color: UIColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)) -> UIButton {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.backgroundColor = color
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 40
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }
        
        let buttonTitles: [[String]] = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "*"],
            ["AC", "0", "=", "/"]
        ]
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 10
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        for row in buttonTitles {
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            horizontalStackView.alignment = .fill
            horizontalStackView.distribution = .fillEqually
            horizontalStackView.spacing = 10
            horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
            verticalStackView.addArrangedSubview(horizontalStackView)
            
            for title in row {
                let color: UIColor = (title == "AC" || title == "+" || title == "-" || title == "*" || title == "/") ? UIColor.orange : UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                let button = createButton(title: title, color: color)
                horizontalStackView.addArrangedSubview(button)
                NSLayoutConstraint.activate([
                    button.heightAnchor.constraint(equalToConstant: 80),
                    button.widthAnchor.constraint(equalToConstant: 80)
                ])
            }
        }
    }
}


