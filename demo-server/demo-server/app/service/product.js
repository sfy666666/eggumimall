const { Service} =require('egg');
class ProductService extends Service{
   async findProducts(keyword){
        //从egg中获取挂载的mysql对象
        const client=this.app.mysql;
        const sql='select * from product';
        //keyword为空全查询
        if(!keyword){
            return await client.query(sql);
        }
        //keyword不为空模糊查询
        else{
            return await client.query(`${sql} where name like (?)`,[`%${keyword}%`]);
        }

    };

    async findProductInfo(id){
        //从egg中获取挂载的mysql对象
        const client=this.app.mysql;
        const sql=`select * from product inner join product_info on product.id = product_info.id where product.id = ${id}`;
        return await client.query(sql);
    }

}

module.exports=ProductService;