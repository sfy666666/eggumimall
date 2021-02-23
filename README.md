# 简易商品列表前后端开发入门
#### 基于umi（React+Typescript）及egg

#### Target目标

1. 学习使用Egg实现数据查询API

2. 学习使用Umi+TS实现页面

3. 学习前后端数据对接


#### 开发环境的准备工作

● 安装好NodeJS

● 安装好yarn&tyarn（加速node依赖包的下载）

● 安装好VS Code代码编辑器

#### 目标要完成前端页面
![效果图](https://images.gitee.com/uploads/images/2021/0223/092416_ab50222a_1091007.png "image.png")

● 上部为搜索条件输入框和搜索按钮

● 点击搜索按钮，可使用关键字进行模糊查询数据

● 下部为商品详情列表数据展示区域


#### 后端的准备工作与目标

##### MySQL数据库的数据准备，数据库表结构只有4个字段:

● id - 唯一识别标识id

● name - 商品名称

● price - 商品单价

● imgurl - 商品图片URL地址

##### 目标实现的服务端API：

● i请求路径 - GET /api/products

● 请求参数 - keyword=xxxx(采用Query String 方式传参)

##### 创建API服务
安装nodejs   [安装步骤](https://www.jianshu.com/p/957f5631faa9)

安装yarn和tyarn
```
npm i -g yarn tyarn
```

测试yarn和tyarn
```
yarn -v;
tyarn -v;
```
##### 工作步骤
● 创建服务端工程目录
```
mkdir samples && cd samples
mkdir demo-server && cd demo-server
```

● 生成egg.js工程骨架：
```
npm init egg --type=simple
```

● 添加mysql数据库驱动依赖：
```
tyarn add egg-mysql
```
检查package.json的dependencies有没有egg-mysql:^3.x

● 配置数据库信息

在config目录下plugin.js中添加
```
mysql:{
    enable:true,
    package:'egg-mysql'
}
```

在config.default.js添加
```
config.mysql={
    client:{
     host:'localhost',
     prot:'3306'
     user:'root',
     password:'password',
     database:'demo'
    }
}
```

● 编写Controller，并配置API路由

在controller下创建product
```
const Controller = require('egg').Controller;

class ProductController extends Controller{

async listProducts(){
    //获取上下文对象
    const { ctx ,service} =this;
    //获取关键词
    const keyword=ctx.query.keyword;
    //调用查询API
    const products = await service.product.findProducts(keyword);
    //egg输出
    ctx.body=products;
   }
}
module.exports=ProductController;
```
router.js
```
'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
    const { router, controller } = app;
    router.get('/', controller.home.index);
    router.get('/api/products', controller.product.listProducts);
};

```

● 编写Service，实现数据库查询
在service下创建product
```
const { Service} =require('egg');
class ProductService extends Service{
  async findProducts(keyword){
    //从egg中获取挂载的mysql对象
    const client=this.app.mysql;
    const sql='select * from product';
    //keyword为空全查询
    if(!keyword){
        return await client.query(sql);
    }
    //keyword不为空模糊查询
    else{
    return await client.query(`${sql} where name like (?)`,[`%${keyword}%`]);
     }
   }
}
module.exports=ProductService;
```
● 测试API
```
tyarn dev
open http://127.0.0.1:7001/api/products
```

#### 创建用户前端
##### 工作步骤
● 创建前端工程目录
```
mkdir demo-client
```

● 生成umi骨架代码：tyarn create @umijs/umi-app

● 安装依赖：tyarn

● 启动服务：tyarn start

● 创建商品页面

index.tsx
```
import styles from './index.less';
import React, { ChangeEvent, useEffect, useState } from 'react';
import {request} from 'umi';

interface Product {
id: number;
name: string;
price: number;
imgurl: string;
}

export default function IndexPage() {
const [products, setProducts] = useState<Product[]>([
// { id: 1, name: '苹果', price: 4999, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
// { id: 1, name: '小米', price: 3999, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
// { id: 1, name: '华为', price: 7999, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
// { id: 1, name: '三星', price: 8999, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
// { id: 1, name: '一加', price: 4399, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
// { id: 1, name: '锤子', price: 2999, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
  ]);

const fetchProductList =async (keyword: string='')=>{
const result=await request('/api/products',{
params:{keyword}
    });
    setProducts(result);
  };

//页面加载完成开始请求
useEffect(()=>{
    fetchProductList();
  },[]);//添加空数组防止死循环

const [keyword,setKeyWord]=useState<string>('');

//输入内容监听
const searchInputChangeHandler=(e:ChangeEvent<HTMLInputElement>)=>{
const txt=e.target.value;
setKeyWord(txt);
  }
//搜索按钮监听
const searchButtonClickHandler=()=>{
fetchProductList(keyword);
  };

return (
<div>
<div className={styles.searchBar}>
<input className={styles.searchInput} onChange={searchInputChangeHandler}></input>
<button className={styles.searchButton} onClick={searchButtonClickHandler}>搜索</button>
</div>

<div className={styles.productList}>
{
products.map(product => {
return (
<div className={styles.productItem} key={product.id}>
<img className={styles.productImage} src={product.imgurl} alt="" width="100" height="150"></img>
<div className={styles.productInfo}>
<div className={styles.productTitle}>{product.name}</div>
<div className={styles.productPrice}>￥{product.price}</div>
</div>
</div>
            )
          })
}
</div>
</div>
  );
}
```
index.less
```
.searchBar{
margin: 15px;
display: flex;
}
.searchInput{
width: 100%;
margin-right: 5px;

}
.searchButton{
width: 60px;
}

.productList{
padding: 5px;

}

.productItem{
display: flex;
border-bottom: 1px solid #cccccc;
padding: 10px;
}

.productImage{
margin-left: 50px;
margin-right: 10px;
height: 130px;
width: 100px;
}

.productInfo{
margin-left: 20px;
display: flex;
flex-direction: column;
justify-content: center;
}
.productTitle{
margin-left: 10px;
font-size: 22px;
}

.productPrice{
font-size: 24px;
color: red;
font-style: italic;
font-weight: 500;
}
```
● 创建静态页面
```
 return (
<div>
<div className={styles.searchBar}>
<input className={styles.searchInput} onChange={searchInputChangeHandler}></input>
<button className={styles.searchButton} onClick={searchButtonClickHandler}>搜索</button>
</div>

<div className={styles.productList}>
{
products.map(product => {
return (
<div className={styles.productItem} key={product.id}>
<img className={styles.productImage} src={product.imgurl} alt="" width="100" height="150"></img>
<div className={styles.productInfo}>
<div className={styles.productTitle}>{product.name}</div>
<div className={styles.productPrice}>￥{product.price}</div>
</div>
</div>
            )
          })
}
</div>
</div>
  )

```

● 调用API接口获取远程数据填充列表页面
```
//导入request包
import {request} from 'umi';

interface Product {
id: number;
name: string;
price: number;
imgurl: string;
}

```

● 跨域调用问题的解决
在umirc.ts中添加代码
```
// 代理配置 解决跨域问题
proxy: {
'/api': {
'target': 'http://127.0.0.1:7002/',
'changeOrigin': true
    }
  },
```

● 搜索的实现
```
//搜索按钮监听
const searchButtonClickHandler=()=>{
    fetchProductList(keyword);
};

...

<input className={styles.searchInput} onChange={searchInputChangeHandler}/>

```

### TIPS
#### 1.配置umi环境变量
获取umi的安装路径

```
yarn global bin
```

我的路径是D:\nodejs\node_global\bin         
将D:\nodejs\node_global\bin添加到系统环境变量中         
#### 2.执行umi、server、now、create-umi-app等命令时提示文件名、目录名或卷标语法不正确
通过yarn global bin命令找到umi.cmd的路径，我的路径是D:\nodejs\node_global\bin,
在bin目录中找到umi.cmd用EditPlus或NotePad打开（记事本打开也可以），内容如下
```
@"%~dp0\C:\Users\Administrator\AppData\Local\Yarn\Data\global\node_modules\.bin\umi.cmd"   %*
```
将C盘符前的6个字符删掉
```
@"C:\Users\Administrator\AppData\Local\Yarn\Data\global\node_modules\.bin\umi.cmd"   %*
```
重启命令行，最好用管理员身份运行，不然有时候会提示umi不是内部或外部命令，如果一直提示不是内部或外部命令需要配置umi环境变量。






