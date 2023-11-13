//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let bankView: BankView = BankView()
    //타이머 변수
    //뱅크의 visit
    override func loadView() {
        view = bankView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    private func setupUI() {
        bankView.addClientButton.addTarget(self, action: #selector(addClientButtonTapped), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addClientButtonTapped() {
        //큐에 10명 넣고
        //10명에 대한 레이블 만들어서 스택뷰에 집어 넣기
        //처음일 경우 타이머 시작
    }
    
    @objc private func resetButtonTapped() {
        //큐에 있는 사람 모두 삭제
        //양쪽 스택뷰의 모든 레이블을 지우고
        //타이머 취소
    }

}

