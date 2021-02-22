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

    }

}

module.exports=ProductService;