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
# This specify the evaluation index to unique value
class ChangeEvaluationsIndexToUnique < ActiveRecord::Migration
  # Increase the index value
  def self.up
    remove_index :rs_evaluations, :name => "index_rs_evaluations_on_reputation_name_and_source_and_target"
    add_index :rs_evaluations, [:reputation_name, :source_id, :source_type, :target_id, :target_type], :name => "index_rs_evaluations_on_reputation_name_and_source_and_target", :unique => true
  end
  # Decrease the index value
  def self.down
    remove_index :rs_evaluations, :name => "index_rs_evaluations_on_reputation_name_and_source_and_target"
    add_index :rs_evaluations, [:reputation_name, :source_id, :source_type, :target_id, :target_type], :name => "index_rs_evaluations_on_reputation_name_and_source_and_target"
  end
end
