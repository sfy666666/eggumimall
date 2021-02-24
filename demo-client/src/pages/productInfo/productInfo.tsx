import styles from './productInfo.less';
import React, { ChangeEvent, useEffect, useState } from 'react';
import { history } from 'umi';
import { request } from 'umi';

//声明商品详情相关变量
interface ProductInfo {
  id: number;
  name: string;
  price: number;
  imgurl: string;
  color: string;
  version: string;
  sub_title: string;
  href: string;
};
//声明颜色
interface ColorData {
  name: string;
}
//声明版本
interface VersionData {
  name: string;
}

//声明颜色选中变量
interface Data {
  selected: string;
};

//声明版本选中变量
interface Version {
  selected: string;
}

export default function Page(props: any) {
  //使用React的State方便修改变量
  const [productInfo, setProductInfo] = useState<ProductInfo>();
  const [data, setData] = useState<Data>();
  const [version, setVersion] = useState<Version>();
  //颜色数组
  const [colorData, setColorData] = useState<ColorData[]>();
  //版本数组
  const [versionData, setVersionData] = useState<VersionData[]>();


  //获取商品详情数据
  const fetchProductInfo = async (id: Number = 1) => {
    //请求eggjs后台获取数据 在umirc.ts中proxy配置了baseUrl
    const result = await request('/api/productInfo', { params: { id } });
    console.log('res', result.data);
    //把获取的数据赋值给productInfo  {code:0,msg:'success',data:{}}
    setProductInfo(result.data);
    console.log('color====', result.data.color.split(','));
    //颜色数组赋值
    let colors: ColorData[] = [];
    result.data.color.split(',').forEach((element: string) => {
      colors.push({
        name: element
      });
    });
    setColorData(colors);

    //版本数组赋值
    let versions: VersionData[] = [];
    result.data.version.split(',').forEach((element: string) => {
      versions.push({
        name: element
      });
    });
    setVersionData(versions);
    console.log('colors', colors);
  };

  //选择按钮
  const selectedHandle = (event: React.MouseEvent<HTMLDivElement, MouseEvent>) => {
    console.log('点击前的data==', data?.selected);
    const index = event.currentTarget.dataset.index;
    if (Boolean(data) && Boolean(data?.selected !== undefined)) {
      setData({
        selected: index
      });
      console.log('index====', index);
      console.log('点击后的data==', data?.selected);
    }

  };

  const selectedVersionHandle = (event: React.MouseEvent<HTMLDivElement, MouseEvent>) => {
    const index = event.currentTarget.dataset.index;
    if (Boolean(version) && Boolean(version?.selected !== undefined)) {
      setVersion({
        selected: index
      });
    }
  };

  useEffect(() => {
    //变量初始化
    setData({
      selected: '0'
    });
    setVersion({
      selected: '0'
    });
    //获取上个页面的传参
    const id = props.location.query.id;
    console.log('props', props);
    console.log('id', props.location.query.id);
    fetchProductInfo(id);

  }, []);

  return (
    <div >
      <div hidden={!productInfo}>
        <h1 className={styles.title}>{productInfo?.name}【图片 价格 品牌 报价】-京东</h1>
        <div className={styles.pItem}>
          <img className={styles.pImage} src={productInfo?.imgurl}></img>
          <div>
            <div className={styles.pName}>{productInfo?.name}</div>
            <div className={styles.pLink}  >
              {productInfo?.sub_title}
              <a href={productInfo?.href} target="_blank">查看&gt;</a>
            </div>

            <div className={styles.bc_243}>
              <div className={styles.jdPrice}>
                <div className={styles.c_flex_baseline}> 
                  <div>京 东 价</div>
                  <span className={styles.price_rmb}>￥</span>
                  <span className={styles.price_number}>{productInfo?.price}</span>
                </div>

              </div>
              <div>累计评价</div>
            </div>

            <div className={styles.c_flex} >
              <div className={styles.item_text} style={{ color: '#999999' }}>选择颜色</div>
              {
                colorData?.map((element: ColorData, index: any) => {
                  return (
                    <div className={data?.selected == index ? styles.item_selected : styles.item} data-index={index} onClick={selectedHandle}>
                      <a href="#none">
                        <img data-img="1" src="//img11.360buyimg.com/n9/s40x40_jfs/t1/151368/14/19888/133860/602dd8f7Ed666edb4/f909a4d1e7b66553.jpg" width="40" height="40" alt={element.name} />
                        <text className={styles.item_text} >{element.name}</text>
                      </a>
                    </div>
                  )
                })
              }
            </div>
            <div className={styles.c_flex} >
              <div className={styles.item_text} style={{ color: '#999999' }}>选择版本</div>
              {
                versionData?.map((element: VersionData, index: any) => {
                  return (
                    <div className={version?.selected == index ? styles.item_selected : styles.item} data-index={index} onClick={selectedVersionHandle}>
                      <a href="#none">
                        <img data-img="1" src="//img11.360buyimg.com/n9/s40x40_jfs/t1/151368/14/19888/133860/602dd8f7Ed666edb4/f909a4d1e7b66553.jpg" width="40" height="40" alt={element.name} />
                        <text className={styles.item_text} >{element.name}</text>
                      </a>
                    </div>
                  )
                })
              }
            </div>

            <a className={styles.car_style} href="https://passport.jd.com/new/login.aspx?ReturnUrl=http%3A%2F%2Fcart.jd.com%2Fgate.action%3Fpid%3D10023260267341%26pcount%3D%26ptype%3D1&amp;r=1614157469622" >加入购物车</a>
          </div>
        </div>
      </div>
      <div hidden={Boolean(productInfo)}>no data</div>
    </div>



  );
}
