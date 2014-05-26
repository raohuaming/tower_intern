class User < ActiveRecord::Base
  has_secure_password validations: false
  # Constant
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  # Verification
  validates :name, presence: { message: '请填写团队或者公司的名称' }
  validates :password, length: { minimum: 6, message: '请设置一个登录密码；至少6位' }
  validates :email, presence: { message: '请填写你的邮箱地址' },
                    uniqueness: { message: '该账号已存在，请直接登录后创建新团队' },
                    format: { with: EMAIL_REGEX, message: '请填写正确的邮箱地址' }
end
