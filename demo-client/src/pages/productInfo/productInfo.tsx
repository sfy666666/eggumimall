import styles from './productInfo.less';
import React, { ChangeEvent, useEffect, useState } from 'react';
import { history } from 'umi';
import { request } from 'umi';

interface ProductInfo {
  id: number;
  name: string;
  price: number;
  imgurl: string;
  color: string;
  version: string;
  sub_title:string;
};

export default function Page(props: any) {
  const [productInfo, setProductInfo] = useState<ProductInfo>();

  const fetchProductInfo = async (id: Number = 1) => {
    const result = await request('/api/productInfo', { params: { id } });
    console.log('res', result.data);
    setProductInfo(result.data);
  };

  useEffect(() => {
    console.log('props', props);
    fetchProductInfo(1);
  }, []);

  return (
    <div>
      <h1 className={styles.title}>荣耀Play4T Pro/荣耀play4tpro 全网通手机【华为麒麟810芯片】 冰岛幻境 8+128GB【碎屏险套装】【图片 价格 品牌 报价】-京东</h1>
      <div className={styles.pItem}>
        <img className={styles.pImage} src={productInfo?.imgurl}></img>
        <div>
          <div className={styles.pName}>{productInfo?.name}</div>
          <div className={styles.pLink}  >
            {productInfo?.sub_title}
            <a href="//item.jd.com/69573262306.html#crumb-wrap" target="_blank">查看&gt;</a>
          </div>

          <div className={styles.bc_243}>
            <div className={styles.jdPrice}>京东价</div>
            <div>累计评价</div>
          </div>
        </div>
      </div>
    </div>
  );
}
