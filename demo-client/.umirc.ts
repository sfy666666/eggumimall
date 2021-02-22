import { defineConfig } from 'umi';

export default defineConfig({
  nodeModulesTransform: {
    type: 'none',
  },
  routes: [
    { path: '/', component: '@/pages/index' },
  ],
  // 代理配置 解决跨域问题
  proxy: {
    '/api': {
      'target': 'http://127.0.0.1:7002/',
      'changeOrigin': true
    }
  },
  fastRefresh: {},
});
