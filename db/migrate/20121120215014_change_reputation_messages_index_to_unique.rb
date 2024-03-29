##
#  Copyright 2012 Twitter, Inc
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
##
# This is the migration for message reupration
# This specify the message index to unique value
class ChangeReputationMessagesIndexToUnique < ActiveRecord::Migration
  # Index value increase
  def self.up
    remove_index :rs_reputation_messages, :name => "index_rs_reputation_messages_on_receiver_id_and_sender"
    add_index :rs_reputation_messages, [:receiver_id, :sender_id, :sender_type], :name => "index_rs_reputation_messages_on_receiver_id_and_sender", :unique => true
  end
  # Index value decrease
  def self.down
    remove_index :rs_reputation_messages, :name => "index_rs_reputation_messages_on_receiver_id_and_sender"
    add_index :rs_reputation_messages, [:receiver_id, :sender_id, :sender_type], :name => "index_rs_reputation_messages_on_receiver_id_and_sender"
  end
end

