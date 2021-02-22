const Controller = require('egg').Controller;

class ProductController extends Controller{

    async listProducts(){
        const { ctx ,service} =this;
        const keyword=ctx.query.keyword;
        const products = await service.product.findProducts(keyword);

        //egg输出
        ctx.body=products;
    }
}

module.exports=ProductController;