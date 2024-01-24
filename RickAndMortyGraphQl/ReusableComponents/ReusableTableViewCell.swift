//
//  ReusableTableViewCell.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import UIKit    

class ReusableTableViewCell: UITableViewCell {
    
    var nibName : String? { get { return nil } } //<<<< Always overwrite this nibName variable in your subclass
    var liveUpdate = false
    var liveUpdateView : UIView?
    
    @IBInspectable var inspectable: Bool { //<<<< Always turn this off in the original tablecell in nib file. Turn this on when reusing in storyboards to see live update
        set {
            liveUpdate = newValue
            xibSetup()
        }
        get {
            return liveUpdate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addSeparator() {
        let seperatorView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 4))
        seperatorView.backgroundColor = .systemBackground
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(seperatorView)
        
        let constraints = [
            seperatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            seperatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            seperatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            seperatorView.heightAnchor.constraint(equalToConstant: 4)
        ]
        NSLayoutConstraint.activate(constraints)
        contentView.addConstraints(constraints)
    }
    
    func xibSetup() {
        liveUpdateView?.removeFromSuperview()
        liveUpdateView = nil
        if liveUpdate {
            guard let view = loadViewFromNib() else { return }
            view.frame = bounds
//            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            liveUpdateView = view
            addSubview(liveUpdateView!)
        }
    }
    
    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate( withOwner: self, options: nil).first as? UIView
    }
}
