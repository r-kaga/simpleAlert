# simpleAlert


### From Storyboard

#### SingleAlert

![singlefromsb](https://user-images.githubusercontent.com/20347995/39996489-a093da40-57ba-11e8-9311-4fe85d36c221.PNG)

```
SingleAlert.show(self, title: "タイトル", message: "メッセージを\n表示しています") { action in
    print(action)
}
```

#### DoubleAlert

![doublefromsb](https://user-images.githubusercontent.com/20347995/39996566-dac197fc-57ba-11e8-9c6d-4abfc597be2e.PNG)

```
DoubleAlert.show(self, title: "タイトル", message: "メッセージを\n表示しています") { action in
    switch action {
        case .Accept : print("accept!")
        case .Cancel : print("cancel!")
    }
}
```

### From Code

#### Single

![singlefromcode](https://user-images.githubusercontent.com/20347995/39996509-acf13cf6-57ba-11e8-8e38-09acf7b37bfa.PNG)

```
SingleAlert.show(self, title: "タイトル", message: "メッセージを\n表示しています") { action in
  print(action)
}
```

#### Double

![doublefromcode](https://user-images.githubusercontent.com/20347995/39996540-cadba3c8-57ba-11e8-8990-f90f63e62f94.PNG)

```
Alert.show(self, title: "Good Job!", message: "You Click The Button", buttonTitle: "OK") { action in
    print("OK")
}
```

