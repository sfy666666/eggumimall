/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80023
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 80023
File Encoding         : 65001

Date: 2021-02-24 18:26:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `imgurl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '荣耀Play4T Pro/荣耀play4tpro 全网通手机【华为麒麟810芯片】 冰岛幻境 8+128GB【碎屏险套装】', '1768.00', 'https://img14.360buyimg.com/n0/jfs/t1/151368/14/19888/133860/602dd8f7Ed666edb4/f909a4d1e7b66553.jpg');
INSERT INTO `product` VALUES ('2', '华为Mate Xs 5G折叠屏手机麒麟990 SoC旗舰芯片 8英寸可折叠全面屏 全网通 星际蓝(8GB+512GB)官方标配', '21599.00', 'https://img14.360buyimg.com/n0/jfs/t1/152562/20/17129/118615/601792c1E9a3c52ec/3723dc9f475e8e4d.jpg');
INSERT INTO `product` VALUES ('3', 'Apple iPhone 11 (A2223) 128GB 黑色 移动联通电信4G手机 双卡双待', '4899.00', 'https://img14.360buyimg.com/n0/jfs/t1/148767/39/18017/86358/5fd32ff0E5ca41721/d885f7c401dfa557.jpg');
INSERT INTO `product` VALUES ('4', 'Apple iPhone 11 Pro Max (A2220) 256GB 深空灰色 移动联通电信4G手机 双卡双待', '10099.00', 'https://img14.360buyimg.com/n0/jfs/t1/122505/19/15070/68848/5f861494Ebe330db5/24bc162f493ec940.jpg');
INSERT INTO `product` VALUES ('5', 'Redmi K30i 5G双模 120Hz流速屏 骁龙765G 前置挖孔双摄 4800万后置四摄 30W快充 8GB+128GB 深海微光 游戏智能手机 小米 红米', '2399.00', 'https://img14.360buyimg.com/n0/jfs/t1/171377/30/5385/146345/60191193E5957688e/0d73e7a521cf85f1.jpg');
INSERT INTO `product` VALUES ('6', '小米 (MI) 红米note8 NOTE8', '1169.00', 'https://img14.360buyimg.com/n0/jfs/t1/159106/30/3408/230309/60013f7eEfb88c976/7149cf5695a79684.jpg');
INSERT INTO `product` VALUES ('7', '华为P40 Pro+ 5G手机（12期免息可选）全网通 陶瓷黑 8GB+256GB', '7958.00', 'https://img14.360buyimg.com/n0/jfs/t1/140722/30/280/43012/5edf2dd9E4453c6c4/f28523fe8b671c9b.jpg');
INSERT INTO `product` VALUES ('8', 'Apple iPhone 12 Pro Max (A2412) 256GB', '10099.00', 'https://img14.360buyimg.com/n0/jfs/t1/122505/19/15070/68848/5f861494Ebe330db5/24bc162f493ec940.jpg');
INSERT INTO `product` VALUES ('9', '索尼（SONY）Xperia1 II 5G智能手机 4K屏 骁龙865 12G+256G 微单技术 蔡司镀膜 拍照游戏 20帧/秒 青山绿', '7699.00', 'https://img14.360buyimg.com/n0/jfs/t1/119131/23/19548/39751/5f7ff05fE7260ab0a/7149ca668295130d.jpg');
INSERT INTO `product` VALUES ('10', '三星 Galaxy S21 5G（SM-G9910）双模5G 骁龙888 超高清专业摄像 120Hz护目屏 游戏手机 8G+128G 梵梦紫', '4999.00', 'https://img14.360buyimg.com/n0/jfs/t1/161261/20/2780/86337/60000c04E9156e5dc/d7971e53b258d25a.jpg');
INSERT INTO `product` VALUES ('11', '坚果 R2 8GB+128GB 浅黑色 1亿像素 骁龙865 双系统双模5G旗舰手机', '3999.00', 'https://img14.360buyimg.com/n0/jfs/t1/129008/17/16117/55063/5f94453eE80b0ec72/8eaad8148b46eafb.jpg');
INSERT INTO `product` VALUES ('12', 'OPPO Ace2手机ace2骁龙865 双模5G 全网通游戏手机二手5G手机 EVA定制版 8GB+256GB', '3299.00', 'https://img14.360buyimg.com/n0/jfs/t1/128252/26/12964/442839/5f648b87E0a55127a/705b79da08ccb3a2.png');
INSERT INTO `product` VALUES ('13', ' vivo iQOO 7 12GB+256GB 传奇版 骁龙888 120W超快闪充 KPL官方赛事电竞手机 双模5G全网通vivoiqoo7', '4198.00', 'https://img14.360buyimg.com/n0/jfs/t1/171097/25/2137/75197/5ffc04a9Ec37de9b6/e6580eefa2fde62b.jpg');
INSERT INTO `product` VALUES ('14', '摩托罗拉 motorola edge s 手机 骁龙870 6400万前后六摄 翡色琉', '2599.00', 'https://img14.360buyimg.com/n0/jfs/t1/164062/30/6028/176105/601fde47E4573279a/ce8071e46418c2af.png');
INSERT INTO `product` VALUES ('15', ' \r\n努比亚 nubia 红魔5S 8GB+128GB 冰封银翼 电竞游戏手机 144Hz屏幕刷新率', '3599.00', 'https://img14.360buyimg.com/n0/jfs/t1/131443/24/5589/88231/5f200b38E611ec903/fd0c2324e5d0f353.jpg');
INSERT INTO `product` VALUES ('16', '谷歌（Google） Pixel 4a 智能手机全高清2020新款 黑色 128GB', '4188.00', 'https://img14.360buyimg.com/n0/jfs/t1/152902/36/15076/68131/600945dcEb052e82b/30a68df9bf2a5ba6.jpg');
INSERT INTO `product` VALUES ('17', ' \r\n荣耀V40 5G 双超级快充 5000万超感光影像 8GB+256GB钛空银 移动联', '3999.00', 'https://img14.360buyimg.com/n0/jfs/t1/152902/36/15076/68131/600945dcEb052e82b/30a68df9bf2a5ba6.jpg');
INSERT INTO `product` VALUES ('18', '魅族17 8GB+128GB AG 梦幻独角兽 骁龙865 旗舰5G手机 30W快充 6400W后置', '3699.00', 'https://img14.360buyimg.com/n0/jfs/t1/135821/23/2709/206234/5eee2f73E082b8d23/a9d7992529e411b8.jpg');
INSERT INTO `product` VALUES ('19', ' \r\n中兴ZTE 天机Axon 20 屏下摄像 6400万四摄 轻薄OLED屏 8GB+128GB 黑洞引力', '2498.00', 'https://img14.360buyimg.com/n0/jfs/t1/147254/2/7405/54255/5f4d095dEbe68db32/20c66fa9efbfff64.jpg');
INSERT INTO `product` VALUES ('20', ' \r\n酷派（Coolpad）BOS-AO128G指纹一体大内存全网通4G安卓手机学生高性价', '729.00', 'https://img14.360buyimg.com/n0/jfs/t1/133653/17/9531/89398/5f5c2810Eb4051b88/31eb8b042830fdaf.jpg');
INSERT INTO `product` VALUES ('21', '联想拯救者电竞手机Pro 12GB+256GB 骁龙865 Plus 双液冷散热 144Hz电竞屏 ', '3699.00', 'https://img14.360buyimg.com/n0/jfs/t1/149177/15/3457/117920/5f16cf3dEe0375d2a/41b1855a5ad94923.jpg');
INSERT INTO `product` VALUES ('22', ' \r\n华为 HUAWEI Mate X2 麒麟9000旗舰芯片 无缝鹰翼折叠 超感知徕卡四摄支持100倍', '17999.00', 'https://img14.360buyimg.com/n0/jfs/t1/167718/22/7174/64869/6033a353Ea278fab2/5d7ab7aec78f6d1f.jpg');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `href` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES ('1', '冰岛幻境,幻夜黑,蓝水翡翠', '6+128G,8+128G', '【当天发货】买就送：壳膜+运费险+碎屏险+一年质保。4800万高感光夜拍三摄，光学屏幕指纹，OLED珍珠屏！4T点此', 'https://item.jd.com/60076267212.html');
INSERT INTO `product_info` VALUES ('2', '星际蓝', '8+512G', '赠.【雨林古树红茶】开增票普票【支持京尊达】原厂正品/全国联保/有质量问题/开箱损/可去当地售后换/修..', '');
INSERT INTO `product_info` VALUES ('3', '黑色,白色,红色,黄色,紫色,绿色', '64GB,128GB,256GB', '【公开版到手价4899元!】选购iPhone11ProMax，仅加2000元得6.5英寸超大显示屏手机！点击抢购！', 'https://item.jd.com/100004770237.html');
INSERT INTO `product_info` VALUES ('4', '海蓝色,金色,石墨色,银色', '64GB,128GB,256GB', '【iPhone的巅峰之作！】推荐选购【值享焕新版】！含2年官方延保AC+，未来购下代iPhone至高返6997元!更多优惠', 'https://pro.jd.com/mall/active/3vhrJRWUDvx84MMSPJ2gnMuggew3/index.html');
INSERT INTO `product_info` VALUES ('5', '紫域幻境,深海微光,时光独白,薄荷冰蓝', '6GB+128GB,8GB+128GB,8GB+256GB', '【小米直供|现货速发】下单赠：【品牌音乐耳机】【晒单红包】新款K30至尊热销中！', 'https://item.jd.com/72002902268.html#crumb-wrap');
