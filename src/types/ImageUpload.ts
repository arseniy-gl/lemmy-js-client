// This file was generated by [ts-rs](https://github.com/Aleph-Alpha/ts-rs). Do not edit this file manually.
import type { ImageUploadId } from "./ImageUploadId";
import type { LocalUserId } from "./LocalUserId";

export interface ImageUpload {
  id: ImageUploadId;
  local_user_id: LocalUserId;
  pictrs_alias: string;
  pictrs_delete_token: string;
  published: string;
}