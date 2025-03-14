resource "aws_instance" "web_1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              cat <<EOT > /var/www/html/index.html
              <html>
              <head><title>Home</title></head>
              <body style="background-color:lightblue;">
              <h1>Hello bala your home page is ready</h1>
              </body>
              </html>
              EOT
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = { Name = "WebServer-Home" }
}

resource "aws_instance" "web_2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_2.id
  security_groups = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              mkdir -p /var/www/html/images
              cat <<EOT > /var/www/html/images/index.html
              <html>
              <head><title>Images</title></head>
              <body style="background-color:lightgreen;">
              <h1>Hello bala your Image page is ready</h1>
              </body>
              </html>
              EOT
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = { Name = "WebServer-Images" }
}

resource "aws_instance" "web_3" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_3.id
  security_groups = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              mkdir -p /var/www/html/register
              cat <<EOT > /var/www/html/register/index.html
              <html>
              <head><title>Register</title></head>
              <body style="background-color:lightcoral;">
              <h1>Hello bala your Register Page is ready</h1>
              </body>
              </html>
              EOT
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = { Name = "WebServer-Register" }
}
