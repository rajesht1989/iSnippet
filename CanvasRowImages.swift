enum ScrollDirection {
    case vertical
    case horizontal
}


func createCanvas(scrollview: UIScrollView, direction: ScrollDirection, images: [UIImage]) {
    let containerView = UIView()
    scrollview.addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.leftAnchor.constraint(equalTo: scrollview.leftAnchor).isActive = true
    containerView.topAnchor.constraint(equalTo: scrollview.topAnchor).isActive = true
    containerView.rightAnchor.constraint(equalTo: scrollview.rightAnchor).isActive = true
    containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor).isActive = true
    
    switch direction {
    case .vertical:
        containerView.widthAnchor.constraint(equalTo: scrollview.widthAnchor).isActive = true
    default:
        containerView.heightAnchor.constraint(equalTo: scrollview.heightAnchor).isActive = true
    }
    
    var previousView: UIImageView?
    for image in images {
        let imageView = UIImageView()
        containerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = image

            switch direction {
            case .vertical:
                imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
                imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
                imageView.heightAnchor.constraint(equalTo: scrollview.heightAnchor).isActive = true
                if let previousView = previousView {
                    imageView.topAnchor.constraint(equalTo: previousView.bottomAnchor).isActive = true
                } else {
                    imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
                }
                
                if images.last == image {
                    imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
                }
            default:
                imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
                imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
                imageView.widthAnchor.constraint(equalTo: scrollview.widthAnchor).isActive = true
                if let previousView = previousView {
                    imageView.leftAnchor.constraint(equalTo: previousView.rightAnchor).isActive = true
                } else {
                    imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
                }
                
                if images.last == image {
                    imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
                }
            }
        previousView = imageView
    }
}

createCanvas(scrollview: UIScrollView(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), direction: .horizontal, images: [UIImage(named: "baby.jpg")!, UIImage(named: "rationCard")!])

