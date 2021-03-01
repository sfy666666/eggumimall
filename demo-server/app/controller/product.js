const Controller = require('egg').Controller;

class ProductController extends Controller{

    //商品列表
    async listProducts(){
        const { ctx ,service} =this;
        const keyword=ctx.query.keyword;
        const products = await service.product.findProducts(keyword);

        //egg输出
        ctx.body=products;
    };

    //商品详情
    async productInfo(){
        const { ctx ,service} =this;
        const id=ctx.query.id;
        const productInfo = await service.product.findProductInfo(id);
        if(productInfo.length>0){
            productInfo[0].id=Number.parseInt(productInfo[0].id);
            //egg输出
            ctx.body=JSON.stringify({
                code:0,
                msg:'success',
                data:productInfo[0]
            });
        }else{
            //egg输出
            ctx.body=JSON.stringify({
                code:1,
                msg:'failed',
                data:null
            });
        }
        
    }
}

module.exports=ProductController;