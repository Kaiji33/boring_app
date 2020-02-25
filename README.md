# boring

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# boring_app
功能：当你登录，打开或者从后台进入都会计数+1，并且与其他人进行排名显示。

    主要界面为4个：登录界面，个人信息，计数界面，排名界面。
    
一. 登录界面，采用谷歌账号验证登录。Firebase里面还有邮箱登录，Facebook登录等方法。这些方法在Flutter官方文档都给出了详细代码，可以直接copy，部分修改。
二. 个人信息界面，展示头像，姓名和名次。Firestore里面可以对数据直接sort排序，但是似乎没用排序完以后直接查询名次的功能。Stackoverflow里有人提出类似问题还没解决，有可能只有自己暴力搜索，尚未完成。
三. 计数界面。计数完成靠监听Android Activity生命周期事件的方法。如何监听在flutter文档中也有详细代码。
四. 排名界面，将数据存入Cloud Firestore，用sort方法排序即可。