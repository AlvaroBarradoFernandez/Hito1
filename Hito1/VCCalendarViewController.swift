
//
//  VCCalendarViewController.swift
//  Hito1
//
//  Created by Alvaro Barrado on 25/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import VACalendar

final class VCCalendarViewController: UIViewController {
    @IBOutlet weak var weekDaysView: VAWeekDaysView! {
        didSet {
            let appereance = VAWeekDaysViewAppearance(symbolsType: .short, calendar: defaultCalendar)
            weekDaysView.appearance = appereance
        }
    }
    let defaultCalendar: Calendar = {
        var calendar = Calendar.current
        calendar.firstWeekday = 2
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar
    }()
    var calendarView: VACalendarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let startDate = formatter.date(from: "01.01.2000 00:00:00")!
        let endDate = formatter.date(from: "01.01.2030 00:00:00")!
        let calendar = VACalendar(
            startDate: startDate,
            endDate: endDate,
            calendar: defaultCalendar
        )
        calendarView = VACalendarView(frame: CGRect(
            x: 0,
            y: weekDaysView.frame.maxY,
            width: view.frame.width,
            height: view.frame.height - weekDaysView.frame.maxY
        ), calendar: calendar)
        calendarView.showDaysOut = false
        calendarView.selectionStyle = .single
        calendarView.dayViewAppearanceDelegate = self
        calendarView.monthViewAppearanceDelegate = self
        calendarView.calendarDelegate = self
        calendarView.scrollDirection = .vertical
        calendarView.setup()
        view.addSubview(calendarView)
    }
}

extension VCCalendarViewController: VAMonthViewAppearanceDelegate {

    func leftInset() -> CGFloat {
        return 10.0
    }
    func rightInset() -> CGFloat {
        return 10.0
    }
    func verticalMonthTitleFont() -> UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    func verticalMonthTitleColor() -> UIColor {
        return .black
    }
    func verticalCurrentMonthTitleColor() -> UIColor {
        return .black
    }
}

extension VCCalendarViewController: VADayViewAppearanceDelegate {
    func textColor(for state: VADayState) -> UIColor {
        switch state {
        case .out:
            return UIColor(red: 214 / 255, green: 214 / 255, blue: 219 / 255, alpha: 1.0)
        case .selected:
            return .black
        case .unavailable:
            return .lightGray
        default:
            return .black
        }
    }
    func textBackgroundColor(for state: VADayState) -> UIColor {
        switch state {
        case .selected:
            return .yellow
        default:
            return .clear
        }
    }
    func shape() -> VADayShape {
        return .circle
    }
    func dotBottomVerticalOffset(for state: VADayState) -> CGFloat {
        switch state {
        case .selected:
            return 2
        default:
            return -7
        }
    }
 /*   func daySelected(for state: VADayState){
        switch state {
        case .selected:
            return calendarView.setSupplementaries([(Date().addingTimeInterval(0), [VADaySupplementary.bottomDots([.red])])])
        default:
            return
        }
    }*/
}

extension VCCalendarViewController: VACalendarViewDelegate {
    func selectedDate(_ date: Date) {
        print(date)
    }
}
