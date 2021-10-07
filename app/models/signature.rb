class Signature < ApplicationRecord
    validates :signature_cod ,numericality: {only_integer: true}
end
