//
//  MonthView.swift
//  Hito1
//
//  Created by Alvaro Barrado on 25/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//
/*
import UIKit


protocol MonthViewDelegate: class{
    func didChangeMonth(monthIndex: Int, year: Int)
}
class MonthView: UIView {
    var monthsArr = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
    var currentMonthIndex = 0
    var currentYear: Int = 0;
    var delegate: MonthViewDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.currentYear.component(.year, from: Date())
        setupViews()
        btnLeft.isEnable=false
    }
    
    @objc func btnLeftRightAction(sender: UIBotton){
        if sender == btnRight{
            currentMonthIndex += 1
            if currentMonthIndex > 11{
                currentMonthIndex = 0
                currentYear += 1
            }
        } else{
            currentMonthIndex -= 1
            if currentMonthIndex < 0{
                currentMonthIndex = 11
                currentYear -= 1
            }
        }
        lblName.text="\(monthsArr[currentMonthIndex]) \(currentYear)"
        delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
    }
    
    func setupViews(){
        self.addSubview(lblName)
        lblName.topAnchor.constraint(equalTo: topAnchor).isActive=true
        lblName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive=true
        lblName.widthAnchor.constraint(equalTo: 150).isActive=true
        lblName.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        lblName.text="\(monthsArr[currentMonthIndex]) \(currentYear)"
        
        self.addSubview(btnRight)
        btnRight.topAnchor.constraint(equalTo: topAnchor).isActive=true
        btnRight.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        btnRight.widthAnchor.constraint(equalTo: 50).isActive=true
        btnRight.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        
        self.addSubview(btnLeft)
        btnLeft.topAnchor.constraint(equalTo: topAnchor).isActive=true
        btnLeft.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        btnLeft.widthAnchor.constraint(equalTo: 50).isActive=true
        btnLeft.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        
    }
    
    let lblName: UILabel = {
        let lbl=UILabel()
        lbl.text="Default Month Year Text"
        lbl.textColor = Style.monthViewLblColor
        lbl.textAlignment = .center
        lbl.font=UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let btnRight: UIBotton = {
        let btn=UIButton()
        btn.setTitle(">", for: .normal)
        btn.setTitleColor(Style.monthViewBtnRightColor, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for: .touchUpInside)
        return btn
    }()
    
    let btnLeft: UIBotton = {
        let btn=UIButton()
        btn.setTitle("<", for: .normal)
        btn.setTitleColor(Style.monthViewBtnLeftColor, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for: .touchUpInside)
        btn.setTitleColor(UIColor.lightGray, for: .disabled)
        return btn
    }()
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
*/
