# Ứng dụng Đặt Vé Xe / Tàu

Ứng dụng Flutter cho phép người dùng tra cứu, đặt vé xe hoặc tàu, thanh toán trực tuyến và nhận vé điện tử với mã QR.

## Cấu trúc dự án

- `lib/main.dart`: Điểm vào ứng dụng và cấu hình routing.
- `lib/screens/`: Các màn hình chính của ứng dụng.
- `lib/models/`: Định nghĩa các mô hình dữ liệu.
- `lib/services/`: Các dịch vụ xử lý logic nghiệp vụ và kết nối backend.
- `lib/widgets/`: Các widget tái sử dụng và animation.
- `lib/utils/`: Các hằng số, bộ kiểm tra dữ liệu và cấu hình.
- `assets/images/`: Thư mục chứa hình ảnh và icon.

## Các tính năng chính

- Tra cứu và lọc chuyến đi.
- Hiển thị danh sách chuyến và chọn ghế với animation.
- Thanh toán trực tuyến (Stripe/PayPal).
- Hiển thị vé điện tử với mã QR.
- Quản lý người dùng và phân quyền.
- Thống kê và biểu đồ doanh thu.

## Hướng dẫn chạy ứng dụng

1. Cài đặt Flutter SDK: https://flutter.dev/docs/get-started/install
2. Tải mã nguồn về máy.
3. Chạy lệnh `flutter pub get` để cài đặt các package.
4. Chạy ứng dụng trên thiết bị hoặc trình giả lập bằng lệnh `flutter run`.

## Cấu hình

- Cập nhật các khóa API và cấu hình Firebase trong `lib/utils/config.dart`.
- Tích hợp backend nếu sử dụng MySQL + JWT.

## Ghi chú

Dự án được thiết kế để mở rộng và dễ dàng tích hợp các tính năng mới.
