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

ActiveRecord::Schema.define(version: 20161122101225) do

  create_table "abouts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "description",      limit: 65535
    t.string   "title"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "namespace"
    t.text     "body",          limit: 65535
    t.string   "resource_id",                 null: false
    t.string   "resource_type",               null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "aids", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "description",     limit: 65535
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "organization_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["organization_id"], name: "index_aids_on_organization_id", using: :btree
    t.index ["post_id"], name: "index_aids_on_post_id", using: :btree
    t.index ["user_id"], name: "index_aids_on_user_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "meta_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "keywords"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "oblasts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.boolean  "active"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",              limit: 65535
    t.string   "keywords"
    t.string   "location"
    t.string   "address"
    t.string   "phone"
    t.string   "longitude"
    t.string   "latitude"
    t.string   "contact_person"
    t.boolean  "active"
    t.string   "url"
    t.integer  "organization_category_id"
    t.integer  "oblast_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "slug"
    t.index ["oblast_id"], name: "index_organizations_on_oblast_id", using: :btree
    t.index ["organization_category_id"], name: "index_organizations_on_organization_category_id", using: :btree
    t.index ["slug"], name: "index_organizations_on_slug", unique: true, using: :btree
  end

  create_table "post_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "body",       limit: 65535
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["post_id"], name: "index_post_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_post_comments_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                         null: false
    t.text     "body",             limit: 65535,                null: false
    t.string   "keywords"
    t.boolean  "open",                           default: true
    t.integer  "organization_id"
    t.integer  "post_category_id"
    t.integer  "user_id"
    t.boolean  "active",                         default: true
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "slug"
    t.index ["organization_id"], name: "index_posts_on_organization_id", using: :btree
    t.index ["post_category_id"], name: "index_posts_on_post_category_id", using: :btree
    t.index ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "user_organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "role"
    t.boolean  "approved",        default: false
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["organization_id"], name: "index_user_organizations_on_organization_id", using: :btree
    t.index ["user_id"], name: "index_user_organizations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
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
    t.string   "slug"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  add_foreign_key "aids", "organizations"
  add_foreign_key "aids", "posts"
  add_foreign_key "aids", "users"
  add_foreign_key "organizations", "oblasts"
  add_foreign_key "organizations", "organization_categories"
  add_foreign_key "post_comments", "posts"
  add_foreign_key "post_comments", "users"
  add_foreign_key "posts", "organizations"
  add_foreign_key "posts", "post_categories"
  add_foreign_key "posts", "users"
  add_foreign_key "user_organizations", "organizations"
  add_foreign_key "user_organizations", "users"
end
