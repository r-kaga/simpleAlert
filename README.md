# simpleAlert


### From Storyboard

#### SingleAlert

![タイトル](simpleAlert/SingleFromSB.PNG)

```
SingleAlert.show(self, title: "タイトル", message: "メッセージを\n表示しています") { action in
    print(action)
}
```

#### DoubleAlert
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
```
SingleAlert.show(self, title: "タイトル", message: "メッセージを\n表示しています") { action in
  print(action)
}
```

#### Double
```
Alert.show(self, title: "Good Job!", message: "You Click The Button", buttonTitle: "OK") { action in
    print("OK")
}
```

