// 每次 generate 后在 public/ 放 .nojekyll
// 每次 deploy 前把 .nojekyll 塞进 .deploy_git/（hexo-deployer-git 不会复制 dotfile）
const fs = require('fs')
const path = require('path')

hexo.extend.filter.register('after_generate', function () {
  const dir = hexo.public_dir
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true })
  }
  const f = path.join(dir, '.nojekyll')
  if (!fs.existsSync(f)) {
    fs.writeFileSync(f, '')
    hexo.log.info('.nojekyll created in public/')
  }
})

hexo.extend.filter.register('before_deploy', function () {
  const deployDir = path.join(hexo.base_dir, '.deploy_git')
  const nojekyllDest = path.join(deployDir, '.nojekyll')
  if (fs.existsSync(deployDir)) {
    fs.writeFileSync(nojekyllDest, '')
    hexo.log.info('.nojekyll copied to .deploy_git/')
  }
})
