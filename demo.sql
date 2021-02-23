/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80023
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 80023
File Encoding         : 65001

Date: 2021-02-23 09:49:23
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
INSERT INTO `product` VALUES ('1', '荣耀Play4T Pro', '1768.00', 'https://img14.360buyimg.com/n0/jfs/t1/151368/14/19888/133860/602dd8f7Ed666edb4/f909a4d1e7b66553.jpg');
INSERT INTO `product` VALUES ('2', '华为Mate Xs 5g折叠屏手机', '21599.00', 'https://img14.360buyimg.com/n0/jfs/t1/152562/20/17129/118615/601792c1E9a3c52ec/3723dc9f475e8e4d.jpg');
INSERT INTO `product` VALUES ('3', 'iPhone 11(A2223) 128GB', '4899.00', 'https://img14.360buyimg.com/n0/jfs/t1/148767/39/18017/86358/5fd32ff0E5ca41721/d885f7c401dfa557.jpg');
INSERT INTO `product` VALUES ('4', 'iPhone 11 Pro Max(A2220) 256GB', '10099.00', 'https://img14.360buyimg.com/n0/jfs/t1/122505/19/15070/68848/5f861494Ebe330db5/24bc162f493ec940.jpg');
INSERT INTO `product` VALUES ('5', 'Redmi k30i 5G双模 骁龙765G', '2399.00', 'https://img14.360buyimg.com/n0/jfs/t1/171377/30/5385/146345/60191193E5957688e/0d73e7a521cf85f1.jpg');
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
