import styles from './index.less';
import React, { ChangeEvent, useEffect, useState } from 'react';
import { Button ,Input} from 'antd';
import "antd/dist/antd.css";
import {request} from 'umi';
import {history} from 'umi';
import url from '*.svg';

interface Product {
  id: number;
  name: string;
  price: number;
  imgurl: string;
}

export default function IndexPage() {
  const [products, setProducts] = useState<Product[]>([
    // { id: 1, name: '苹果', price: 4999, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
    // { id: 1, name: '小米', price: 3999, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
    // { id: 1, name: '华为', price: 7999, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
    // { id: 1, name: '三星', price: 8999, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
    // { id: 1, name: '一加', price: 4399, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
    // { id: 1, name: '锤子', price: 2999, imgurl: 'https://img10.360buyimg.com/n1/s450x450_jfs/t1/168290/10/7108/204224/6030d358E68bde6a5/dc8c9597a09d84d0.jpg' },
  ]);

  const fetchProductList =async (keyword: string='')=>{
    const result=await request('/api/products',{
      params:{keyword}
    });
    setProducts(result);
  };

  useEffect(()=>{
    fetchProductList();
  },[]);//添加空数组防止死循环

  const [keyword,setKeyWord]=useState<string>('');

  //输入内容监听
  const searchInputChangeHandler=(e:ChangeEvent<HTMLInputElement>)=>{
    const txt=e.target.value;
    setKeyWord(txt);
  }
  
  //搜索按钮监听
  const searchButtonClickHandler=()=>{
    fetchProductList(keyword);
  };

  const onItemClick=(event: React.MouseEvent<HTMLDivElement, MouseEvent>)=>{
    const index =event.currentTarget.dataset.index;
    console.log('event',event);
    if(index){
      console.log("点击了",products[Number.parseInt(index)].name);
      history.push('/productInfo?id='+products[Number.parseInt(index)].id);
    }
  };

  return (
    <div>
       <h1 className={styles.title}>Jingdong Mall</h1>
      <div className={styles.searchBar}>
        <Input className={styles.searchInput} onChange={searchInputChangeHandler}></Input>
        <Button type='primary' className={styles.searchButton} onClick={searchButtonClickHandler} >搜索</Button>
      </div>

      <div className={styles.productList}>
        {
          products.map((product,index )=> {
            return (
              <div className={styles.productItem} key={product.id} onClick={onItemClick} data-index={index}>
                <img className={styles.productImage} src={product.imgurl} alt="" width="100" height="150"></img>
                <div className={styles.productInfo}>
                  <div className={styles.productTitle}>{product.name}</div>
                  <div className={styles.productPrice}>￥{product.price}</div>
                </div>
              </div>
            )
          })
        }
      </div>
    </div>
  );
}
