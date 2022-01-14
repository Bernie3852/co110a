# Nand2tetris總繳交點
###### 以下所有程式碼皆為原創，並在最後附上FullAdder電路總圖
| [Week 1](https://github.com/Bernie3852/co110a/blob/master/01/Week%201.md) | [Week 2](https://github.com/Bernie3852/co110a/blob/master/01/Week%202.md) | [Week 3](https://github.com/Bernie3852/co110a/blob/master/02/Week%203.md) | [Week 4](https://github.com/Bernie3852/co110a/blob/master/02/Week%204.md) | [Week 5](https://github.com/Bernie3852/co110a/blob/master/03/a/Week%205.md)  |
|--------|--------|--------|--------|---------|
| [Week 6](https://github.com/Bernie3852/co110a/blob/master/03/a/Week%206.md) | [Week 7](https://github.com/Bernie3852/co110a/blob/master/04/Week%207.md) | [Week 8](https://github.com/Bernie3852/co110a/blob/master/05/Week%208.md) | [Week 9](https://github.com/Bernie3852/co110a/blob/master/05/Week%209.md) | Week 10 |  

### 完整的FullAdder設計  
在把這張圖繪製出來之後，發現其實電路裡充滿了不必要的Not-Not相接  
![20211104_132451](https://user-images.githubusercontent.com/27776034/149426005-befd18fe-2105-48cd-a6e0-bd2ca6c7fd7f.jpg)
  
於是乎著手處裡將Not-Not相接處消去，發現整體Nand用量大幅度的減少  
![20211104_132355](https://user-images.githubusercontent.com/27776034/149426020-b99c1624-84c5-46dc-b9f4-70cead6765ac.jpg)
  
再進一步將重複運算過的輸入合併後甚至只需要12個Nand，便能夠完成一個FullAdder  
![20211104_132202](https://user-images.githubusercontent.com/27776034/149426036-73fa0e28-1eaa-4c79-92ec-e8b0999fdb7d.jpg)
  
由此可得知即便邏輯上看似最簡，到了實際應用的場面可能的結果  
這點可以很清楚地從上方電路設計圖得出
