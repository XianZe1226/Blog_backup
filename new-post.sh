#!/bin/bash
# 用法: ./new-post.sh "文章标题"
# 自动创建博客并分配当前可用的最大编号封面图片

TITLE="$1"
if [ -z "$TITLE" ]; then
  echo "用法: ./new-post.sh \"文章标题\""
  exit 1
fi

IMAGES_DIR="source/images"
COVER=$(ls "$IMAGES_DIR"/*.jpg 2>/dev/null | grep -oE '[0-9]+' | sort -n | tail -1)
if [ -z "$COVER" ]; then
  COVER=1
fi

POST_FILE="source/_posts/${TITLE}.md"
if [ -f "$POST_FILE" ]; then
  echo "文件已存在: $POST_FILE"
  exit 1
fi

DATE=$(date +%Y-%m-%d)

cat > "$POST_FILE" <<EOF
---
title: ${TITLE}
date: ${DATE}
updated: ${DATE}
tags: 
categories:
keywords:
description:
cover: /images/${COVER}.jpg

---

# ${TITLE}

在这里写内容...
EOF

echo "已创建: $POST_FILE"
echo "封面图片: /images/${COVER}.jpg"
