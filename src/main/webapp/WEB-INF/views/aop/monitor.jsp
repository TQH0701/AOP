<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Giám sát AOP</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h2 {
            font-weight: bold;
            color: #007bff;
            font-size: 32px;
            text-align: center;
            margin-bottom: 30px;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            margin-top: 50px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .row.mb-3 {
            margin-bottom: 20px;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            font-weight: bold;
            border-radius: 30px; /* Rounded corners */
            padding: 10px 20px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
            transform: scale(1.1); /* Button grow effect */
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            font-weight: bold;
            border-radius: 30px; /* Rounded corners */
            padding: 10px 20px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
            transform: scale(1.1); /* Button grow effect */
        }

        .log-container {
            max-height: 500px;
            overflow-y: auto;
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fafafa;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .log-entry {
            background-color: #f8f9fa;
            padding: 15px;
            margin-bottom: 10px;
            border-left: 5px solid #007bff;
            font-family: 'Courier New', monospace;
            white-space: pre-wrap;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .log-entry:hover {
            background-color: #e9ecef; /* Hover effect */
        }

        .alert-info {
            background-color: #e9f7fe;
            color: #0c5460;
            border: 1px solid #bee5eb;
            text-align: center;
            padding: 15px;
            border-radius: 5px;
            font-size: 18px;
            transition: all 0.3s ease;
        }

        .alert-info:hover {
            background-color: #d1ecf1; /* Hover effect */
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="row mb-3">
            <div class="col">
                <h2>Giám sát AOP</h2>
                <p>Tổng số log: <strong>${totalLogs}</strong></p>
                <p>Thời gian hiện tại: <strong>${currentTime}</strong></p>
            </div>
            <div class="col text-right">
                <form id="clearLogsForm" action="<c:url value='/aop-monitor/clear'/>" method="post" style="display: inline;">
                    <button type="submit" class="btn btn-warning">Xóa Nhật ký</button>
                </form>
                <a href="<c:url value='/HomeContro'/>" class="btn btn-secondary ml-2">Quay lại Trang Chủ</a>
            </div>
        </div>

        <div class="log-container" id="logContainer">
            <c:forEach items="${logs}" var="log">
                <div class="log-entry">
                    ${log}
                </div>
            </c:forEach>

            <c:if test="${empty logs}">
                <div class="alert alert-info">
                    <h4>Không có nhật ký nào.</h4>
                    Hãy thực hiện một số thao tác để xem AOP hoạt động!
                </div>
            </c:if>
        </div>
    </div>

    <script src="<c:url value='/webjars/jquery/3.5.1/jquery.min.js'/>"></script>
    <script src="<c:url value='/webjars/bootstrap/4.6.0/js/bootstrap.min.js'/>"></script>
    <script>
        // Làm mới log mà không reload toàn trang
        setInterval(function() {
            $.ajax({
                url: '<c:url value='/aop-monitor'/>',
                type: 'GET',
                success: function(data) {
                    const logs = $(data).find('#logContainer').html();
                    $('#logContainer').html(logs);
                }
            });
        }, 5000);

        // Xóa log với hiệu ứng fadeOut
        $('#clearLogsForm').on('submit', function(e) {
            e.preventDefault();
            $.post($(this).attr('action'), function() {
                $('.log-entry').fadeOut(500, function() {
                    $(this).remove();
                });
                setTimeout(function() {
                    location.reload();
                }, 600);
            });
        });
    </script>
</body>
</html>
