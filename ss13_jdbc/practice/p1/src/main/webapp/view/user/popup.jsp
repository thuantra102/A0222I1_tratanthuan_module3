<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/27/2022
  Time: 9:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #00000085;
        }
        .modal_content {
            position: relative;
            width: 500px;
            height: 500px;
            background: white;
        }
        #close {
            position: absolute;
            font-weight: 600;
            top: 5px;
            right: 5px;
            z-index: 999;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="modal">
        <div class="modal_content">
            <span id="close" onclick="closePopup()" style="font-size: 24px;">&times;</span>
            <div>

            </div>
        </div>
    </div>
</body>
</html>
