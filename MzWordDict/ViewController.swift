//
//  ViewController.swift
//  MzWordDict
//
//  Created by Minjae Kim on 5/17/24.
//

import UIKit

fileprivate struct Word {
    let word: String
    let description: String
}

class ViewController: UIViewController {

    @IBOutlet weak var textFieldCoverView: UIView!
    @IBOutlet weak var wordSearchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet var randomButtons: [UIButton]!
    
    @IBOutlet weak var descriptionImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var words: [Word] = [
        Word(word: "오우예 씨몬", description: "‘오우예 씨몬’은 어느 한 가수의 가사 중에서 Oh Yeah C’mon 이라는 단어에서 탄생된 밈입니다.\n‘오우예 씨몬’ 단어 자체에 특별한 의미는 없으며 감탄사의 느낌으로 쓰이고 있습니다."),
        Word(word: "당모치", description: "‘당모치’는 ‘당연히 모든 치킨은 옳다’라는 앞글자를 줄여서 탄생한 MZ 신조어입니다.\n1인 1닭, 치느님, 치맥 등 치킨 관련 유행어가 참 많은데 당모치라는 단어가 새롭게 생겼습니다."),
        Word(word: "잼얘", description: "‘잼얘’는 ‘재밋는 이야기’를 줄여서 사용하는 단어입니다.\n그리 길지 않은 문장인데 요즘 MZ 세대들 사이에서는 줄여서 말하는 것이 유행인 것 같습니다.\n친구들과 대화를 나눌 때 “오늘 무슨 잼얘없니” 라고 사용하시면 되겠습니다."),
        Word(word: "뉴런공유", description: "학창시절 과학시간에 배웠던 ‘뉴런’은 신경계를 구성하는 주요 세포입니다.\n‘뉴런 공유’는 주로 나와 생각이나 행동이 비슷한 사람을 보고 뉴런을 공유한 것과 같이 유사하다고 말을 할 때 쓰이는 단어입니다."),
        Word(word: "분모자처럼 뽑네", description: "‘분모자처럼 뽑네’는 분모자의 특성인 잘 끊어지지 않는다는 점을 살려 아이디어나 생각을 끊임없이 발휘한다거나 능력, 실력이 출중하다는 의미를 가지고 있습니다.\n예를 들어, “제가 아이디어를 분모자처럼 뽑아보겠습니다”와 같이 응용하여 사용할 수 있습니다."),
        Word(word: "드르륵 칵", description: "‘드르륵 칵’은 편의점 야외에 설치된 플라스탁 의자를 지칭하는 단어라고 합니다.\n저도 처음 봤을 때는 어떻게 탄생한 것인지 상당히 궁금함이 있었습니다.\n편의점 야외의 플라스틱 의자를 끌 때 아스팔트 바닥과 마찰이 생기면서 나는 소리가 ‘드르륵 칵’과 유사하다는 것에서 탄생한 신조어입니다."),
        Word(word: "말아주다", description: "‘말아주다’는 아이돌 팬덤에서 주로 사용하는 나의 최애 가수가 무언가를 해줄 때 사용하는 단어라고 합니다.\n예를 들어 “에스파가 말아주는 강렬한 포즈”, “뉴진스가 말아주는 y2k 감성댄스” 등이 있습니다.\n이 때, ‘말아주는’을 ‘해주는’이라고 해석하신다면 이해가 쉬우실겁니다."),
        Word(word: "갓생", description: "‘갓생’은 ‘신(GOD) + 인생’이 합쳐진 단어로 ‘남들보다 열심히 살아가는 모습’ 이라는 의미를 가지고 있습니다.\n주로 SNS에 갓생살기, 갓생도전, 갓생러 등의 단어를 사용하기도 하며 운동, 독서, 공부 등의 목표를 가지고 열심히 사는 모습을 말한다고 생각하시면 됩니다."),
        Word(word: "비담", description: "'비담’은 ‘비주얼 담당’의 줄임말로 주로 아이돌 멤버 중에서 가장 잘생기거나 예쁜 멤버를 말할 때 사용합니다."),
        Word(word: "레게노", description: "‘레게노’는 레전드를 뜻하는 단어인 Legend를 과거 한 유튜버가 잘못 발음하면서부터 유행하기 시작했습니다.\n잘못된 발음이 시청자들의 큰 반응을 얻어 전국적으로 유행하게 된 계기가 되었다고 보시면 됩니다."),
        Word(word: "꾸안꾸", description: "MZ 신조어라고 하기에는 많이 지난 단어인 ‘꾸안꾸’는 ‘꾸민 듯 안꾸민 듯 자연스럽게 꾸민 모습’을 뜻합니다.\n꾸안꾸 머리, 패션이 한 때는 유행어처럼 쓰였던 기억이 납니다."),
        Word(word: "트민남", description: "MBC 예능 나혼자산다의 전현무님을 통해 많이들 알고 있으신 단어입니다.\n‘트민남’은 ‘트렌드에 민감한 남자’라는 뜻으로 연예인이나 SNS 인플루언서들이 입는 옷이나 패션, 취미, 음식 등을 좇아 따라하는 사람을 말합니다."),
        Word(word: "구취", description: "구취’는 ‘구독 취소’의 줄임말로 유튜브에서 자신이 좋아하는 유튜버를 구독했었다가 다시 구독을 취소한다는 의미로 사용합니다.\n주로 사생활 또는 인성 논란으로 물의를 빚은 유튜버의 영상 댓글에 ‘나 오늘 구취함’ 등의 방식으로 사용합니다."),
        Word(word: "좋댓구알", description: "‘좋댓구알’ 역시 유튜브에서 나온 신조어입니다.\n주로 유튜버들이 사용하는 용어이며 자신의 영상과 채널에 ‘좋아요, 댓글, 구독, 알림설정’을 요청하는 것을 줄여서 사용합니다.\n단, 모르는 사람이 들을 때에는 욕(?)처럼 들릴 수 있으니 발음을 조심할 필요가 있습니다."),
        Word(word: "보배", description: "‘보배’라는 단어는 원래 귀하고 소중한 물건을 지칭하는 단어로 사용해왔습니다.\n하지만 요즘 MZ세대 사이에서는 ‘보배’가 보조배터리의 줄임말로 사용되고 있습니다.\n처음 보는 분들이라면 ‘보배’가 보조배터리를 지칭하는지 전혀 감이 안오실 것 같네요."),
        Word(word: "ㄹㄱㅎㅃ", description: "‘ㄹㄱㅎㅃ’은 ‘~라고 할 뻔’의 자음 초성만으로 줄여서 사용하는 신조어입니다.\n주로 유튜브나 인스나, 카카오톡 등 SNS에서 사용하는 단어이며 약간의 추임새처럼 사용하고 있습니다.\n(예) 고기먹자 ㄹㄱㅎㅃ? 공부하자 ㄹㄱㅎㅃ?"),
        Word(word: "머선129", description: "‘머선 129’는 ‘무슨 일이야’의 변형된 표현입니다.\n‘무슨 일이야’의 경상도 사투리가 ‘머슨 일이고’처럼 쓰이는데 이를 다시 변형하여 ‘머선 129’ 와 같이 사용합니다.\n의미는 ‘무슨 일이야’와 똑같지만 조금 재밋는 표현으로 사용한다고 생각하시면 됩니다."),
        Word(word: "홀리몰리", description: "‘홀리몰리’는 영어 ‘holy moly’를 한글로 표현한 것으로 ‘어머나, 우와’와 같은 감탄사로 사용하는 유행어입니다.\n요즘에는 더 나아가 ‘홀리몰리과카몰리’라고 사용한다고도 합니다."),
        Word(word: "군싹", description: "‘군싹’은 ‘군침이 싹 도네’의 줄임말입니다.\n처음 유래는 양말에 있는 어떤 한 캐릭터에서 시작되었습니다.\n양말의 앞면에서 볼 때에는 웃고 있다가, 양말을 뒤집어 보니 화난 듯한 얼굴을 한 그 모습을 보고 ‘군침이 싹 도네’라는 말이 유행되었고 이를 다시 줄여서 ‘군싹’으로 바뀌었습니다.\n요즘에는 맛있는 음식을 보고도 자주 쓰는 단어입니다."),
        Word(word: "오운완", description: "요즘 MZ세대들은 자기 관리를 중요시하기 때문에 헬스, 달리기, 필라테스, 요가 등 다양한 운동을 즐기고 있습니다.\n‘오운완’은 ‘오늘 운동 완료’의 줄임말로 오늘 해야할 운동을 모두 마쳤다는 것을 의미합니다.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIConfig()
    }
    
    private func UIConfig() {
        textFieldConfig()
        randomWordsButtonConfig()
        descriptionConfig()
    }

    private func textFieldConfig() {
        self.textFieldCoverView.layer.borderWidth = 2
        self.textFieldCoverView.layer.borderColor = UIColor.black.cgColor
        
        self.wordSearchTextField.borderStyle = .none
        
        self.searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        self.searchButton.tintColor = .white
        self.searchButton.backgroundColor = .black
    }
    
    private func shuffledWords() {
        self.words.shuffle()
        while Array(words[0...3]).contains(where: { $0.word == wordSearchTextField.text ?? "" }) { // 검색어와 겹치지 않도록 신조어 배열 shuffle
            self.words.shuffle()
        }
        
        for i in 0...3 {
            self.randomButtons[i].setTitle(words[i].word, for: .normal)
        }
    }
    
    private func randomWordsButtonConfig() {
        let fontSize: CGFloat = 15
        let tintColor: UIColor = .black
        let cornerRadius: CGFloat = 10
        let borderWidth: CGFloat = 1
        let borderColor: CGColor = UIColor.black.cgColor
        
        for i in 0...3 {
            let button = self.randomButtons[i]
            
            button.titleLabel?.font = .systemFont(ofSize: fontSize)
            button.tintColor = tintColor
            button.layer.cornerRadius = cornerRadius
            button.layer.borderWidth = borderWidth
            button.layer.borderColor = borderColor
        }
        
        shuffledWords()
    }
    
    private func descriptionConfig() {
        self.descriptionImageView.contentMode = .scaleToFill
        self.descriptionImageView.image = UIImage.background
        
        self.descriptionLabel.textAlignment = .center
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.text = "검색창에 입력해보세요."
        self.descriptionLabel.font = .systemFont(ofSize: 15)
    }
    
    private func search() {
        let searchText = self.wordSearchTextField.text ?? ""
        
        for word in words {
            if word.word == searchText {
                self.descriptionLabel.text = word.description
                return
            }
        }
        
        self.descriptionLabel.text = "검색결과가 없습니다."
    }
    
    @IBAction func searchTextFieldReturned(_ sender: UITextField) {
        search()
        shuffledWords()
    }
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        search()
        view.endEditing(true)
        shuffledWords()
    }
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        let randomWord = sender.titleLabel?.text ?? ""
        for word in words {
            if word.word == randomWord {
                self.wordSearchTextField.text = word.word
                self.descriptionLabel.text = word.description
                self.wordSearchTextField.endEditing(true)
                return
            }
        }
    }
    
    @IBAction func bacgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

