//
//  SegmentControl.swift
//  Pods
//
//  Created by Steve on 2017/7/3.
//
//


public class SegmentControl: UIView {

    private var titles: [String] = []
    private var selectedIndex: ((Int) -> Void)?
    private var bottomLine: UIView!
    private var items: [UIButton] = []
    private var style: SetmentStyle!

    public init(frame: CGRect, style: SetmentStyle? = SetmentStyle(), titles: [String], selectedIndex: ((Int) -> Void)? = nil) {
        super.init(frame: frame)
        self.titles = titles
        self.selectedIndex = selectedIndex
        self.style = style
        loadSubview()
    }

    func loadSubview() {
        self.backgroundColor = style.backgroundColor
        let itemWidth = UIScreen.main.bounds.width / CGFloat(titles.count)
        for (idx, title) in self.titles.enumerated() {
            let item = UIButton(frame: CGRect(x: CGFloat(idx) * itemWidth, y: 0, width: itemWidth, height: bounds.height))
            item.tag = idx
            item.isSelected = idx == 0 ? true : false
            item.titleLabel?.font = self.style.titleFont
            item.setTitleColor(self.style.selectedColor, for: .selected)
            item.setTitleColor(self.style.normalColor, for: .normal)
            item.setTitle(title, for: .normal)
            item.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
            addSubview(item)
            self.items.append(item)
        }
        let lineWidth = min(itemWidth, style.bottomLineMaxwidth)
        let lineMinx = (itemWidth - style.bottomLineMaxwidth) / 2 > 0 ? (itemWidth - style.bottomLineMaxwidth) / 2 : 0
        bottomLine = UIView(frame: CGRect(x: lineMinx, y: bounds.height - 6, width: lineWidth, height: 2))
        bottomLine.backgroundColor = style.selectedColor
        addSubview(bottomLine)
    }

    func click(sender: UIButton)  {
        UIView.animate(withDuration: 0.3) {
            sender.isSelected = true
            self.items.filter({ $0.tag != sender.tag }).forEach({ $0.isSelected = false })
            self.bottomLine.center = CGPoint(x: sender.center.x, y: self.bottomLine.center.y)
        }
        self.selectedIndex?(sender.tag)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


