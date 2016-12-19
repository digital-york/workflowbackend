# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161122133903) do

  create_table "bookmarks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                     null: false
    t.string   "user_type"
    t.string   "document_id"
    t.string   "document_type"
    t.binary   "title",         limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["document_id"], name: "index_bookmarks_on_document_id", using: :btree
    t.index ["user_id"], name: "index_bookmarks_on_user_id", using: :btree
  end

  create_table "checksum_audit_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "file_set_id"
    t.string   "file_id"
    t.string   "version"
    t.integer  "pass"
    t.string   "expected_result"
    t.string   "actual_result"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["file_set_id", "file_id"], name: "by_file_set_id_and_file_id", using: :btree
  end

  create_table "curation_concerns_operations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "status"
    t.string   "operation_type"
    t.string   "job_class"
    t.string   "job_id"
    t.string   "type"
    t.text     "message",        limit: 65535
    t.integer  "user_id"
    t.integer  "parent_id"
    t.integer  "lft",                                      null: false
    t.integer  "rgt",                                      null: false
    t.integer  "depth",                        default: 0, null: false
    t.integer  "children_count",               default: 0, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["lft"], name: "index_curation_concerns_operations_on_lft", using: :btree
    t.index ["parent_id"], name: "index_curation_concerns_operations_on_parent_id", using: :btree
    t.index ["rgt"], name: "index_curation_concerns_operations_on_rgt", using: :btree
    t.index ["user_id"], name: "index_curation_concerns_operations_on_user_id", using: :btree
  end

  create_table "datastreamPaths", primary_key: "tokenDbID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token", limit: 199, default: "", null: false
    t.string "path",              default: "", null: false
    t.index ["token"], name: "token", unique: true, using: :btree
  end

  create_table "dcDates", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "pid",    limit: 64, null: false, collation: "utf8_bin"
    t.bigint "dcDate",            null: false
    t.index ["pid"], name: "pid", using: :btree
  end

  create_table "doFields", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "pid",           limit: 64,                  null: false, collation: "utf8_bin"
    t.string "label"
    t.string "state",         limit: 1,     default: "A", null: false
    t.string "ownerId",       limit: 64
    t.bigint "cDate",                                     null: false
    t.bigint "mDate",                                     null: false
    t.bigint "dcmDate"
    t.text   "dcTitle",       limit: 65535
    t.text   "dcCreator",     limit: 65535
    t.text   "dcSubject",     limit: 65535
    t.text   "dcDescription", limit: 65535
    t.text   "dcPublisher",   limit: 65535
    t.text   "dcContributor", limit: 65535
    t.text   "dcDate",        limit: 65535
    t.text   "dcType",        limit: 65535
    t.text   "dcFormat",      limit: 65535
    t.text   "dcIdentifier",  limit: 65535
    t.text   "dcSource",      limit: 65535
    t.text   "dcLanguage",    limit: 65535
    t.text   "dcRelation",    limit: 65535
    t.text   "dcCoverage",    limit: 65535
    t.text   "dcRights",      limit: 65535
    t.index ["pid"], name: "pid", using: :btree
  end

  create_table "doRegistry", primary_key: "doPID", id: :string, limit: 64, collation: "utf8_bin", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "systemVersion",            default: 0,   null: false
    t.string  "ownerId",       limit: 64
    t.string  "objectState",   limit: 1,  default: "A", null: false
    t.string  "label",                    default: ""
  end

  create_table "modelDeploymentMap", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "cModel", limit: 64, null: false, collation: "utf8_bin"
    t.string "sDef",   limit: 64, null: false, collation: "utf8_bin"
    t.string "sDep",   limit: 64, null: false, collation: "utf8_bin"
  end

  create_table "objectPaths", primary_key: "tokenDbID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token", limit: 64, default: "", null: false
    t.string "path",             default: "", null: false
    t.index ["token"], name: "token", unique: true, using: :btree
  end

  create_table "pidGen", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "namespace", null: false, collation: "utf8_bin"
    t.integer "highestID", null: false
  end

  create_table "searches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary   "query_params", limit: 65535
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_searches_on_user_id", using: :btree
  end

  create_table "single_use_links", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "downloadKey"
    t.string   "path"
    t.string   "itemId"
    t.datetime "expires"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "guest",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "version_committers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "obj_id"
    t.string   "datastream_id"
    t.string   "version_id"
    t.string   "committer_login"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
