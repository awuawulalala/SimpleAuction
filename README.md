# SimpleAuction
a simple auction application base on etherum bolcokchain


## 选题简介

为了满足拍卖时人们的资金安全以及保证匿名性，我编写了一个简单的商品拍卖的智能合约。一个卖家（受益人）发起竞拍，许多的竞拍者参加竞拍，参加者互相出价，给出相应的价值；当发现有人给出的价格超过了自己的出价后，竞拍者可选择放弃上次竞价，并拿回自己的出价。时间结束之后，出价最高的人将付出自己承诺的价值到受益人的账户中。

## 说明：代码中总共有一下几个功能可供使用：

构造函数，产生一个竞拍事件，记录竞拍的商品名、竞拍的时间、最终的受益人
![](https://github.com/awuawulalala/SimpleAuction/blob/master/images/1.png)

竞拍函数，需要参与竞拍的人调用该函数，并给出自己的出价的价值，当竞拍人的出价超过了当前的最高出价时，该次出价有效
![](https://github.com/awuawulalala/SimpleAuction/blob/master/images/2.png)

放弃函数，当竞拍人想放弃此次竞拍时，可以调用此函数，拿回自己的出价
![](https://github.com/awuawulalala/SimpleAuction/blob/master/images/3.png)

竞拍结束函数，由出价者调用，当竞拍时间到之后，可与结束竞拍，并收获最高出价的价值，竞拍结束
![](https://github.com/awuawulalala/SimpleAuction/blob/master/images/4.png)

## 测试样例;
首先解锁所有需要的账户;

创建一个竞拍事件，受益人为第一个用户；
![](https://github.com/awuawulalala/SimpleAuction/blob/master/images/5.png)

第二个用户出价10；
![](https://github.com/awuawulalala/SimpleAuction/blob/master/images/6.png)
可以看出转账让区块链产生了挖矿工作，产生新区块以确认转账；

第三个用户出价20；
![](https://github.com/awuawulalala/SimpleAuction/blob/master/images/7.png)

第二个用户看到自己的出价被超过，决定放弃，取消自己的出价；
![](https://github.com/awuawulalala/SimpleAuction/blob/master/images/8.png)

时间到了之后，调用结束函数，结束本次竞拍，受益人获得最高出价的收益；
![](https://github.com/awuawulalala/SimpleAuction/blob/master/images/9.png)

结束之后，等待挖矿产生新区块，可以看到，受益人与第3个用户产生了账户余额的变化。
