import { defineConfig } from 'umi';

export default defineConfig({
  nodeModulesTransform: {
    type: 'none',
  },
  routes: [
    { path: '/', component: '@/pages/index' },
    { path: '/productInfo', component: '@/pages/productInfo/productInfo' }
  ],
  // 代理配置 解决跨域问题
  proxy: {
    '/api': {
      'target': 'http://127.0.0.1:7001/',
      'changeOrigin': true
    }
  },
  fastRefresh: {},
  dva:{},
  antd:{}
});
