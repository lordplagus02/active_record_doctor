require 'test_helper'

require 'active_record_doctor/printers/io_printer'

class ActiveRecordDoctor::Printers::IOPrinterTest < ActiveSupport::TestCase
  def test_unindexed_foreign_keys
    assert_equal(<<EOF, unindexed_foreign_keys({ "users" => ["profile_id", "account_id"], "account" => ["group_id"] }))
account group_id
users account_id profile_id
EOF
  end

  private

  def unindexed_foreign_keys(argument)
    io = StringIO.new
    ActiveRecordDoctor::Printers::IOPrinter.new(io: io).unindexed_foreign_keys(argument)
    io.string
  end
end
