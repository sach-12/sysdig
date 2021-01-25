--[[
Copyright (C) 2013-2018 Draios Inc dba Sysdig.

This file is part of sysdig.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

--]]

view_info = 
{
	id = "s3_file_summary",
	name = "S3 File Summary",
	description = "Show the s3 files that have been accessed and, for each file, the download/upload statistics.",
	tips = {"In order to get upload/downdload events, you need to enable object-level logging in your Cloudtrail stream. Refer to the AWS documentation to learn how to do it."},
	tags = {"csysdig-aws"},
	view_type = "table",
	filter = "ct.src=s3",
	applies_to = {"", "ct.name", "ct.user", "ct.region", "ct.src", "ct.useragent", "ct.srcip", "s3.bucket"},
	is_root = false,
	drilldown_target = "ct_sources",
	use_defaults = false,
	columns = 
	{
		{
			name = "NA",
			field = "s3.uri",
			is_key = true,
		},
		{
			name = "B TOT",
			field = "s3.bytes",
			description = "Bandwidth generated by downloads+uploads of this file.",
			colsize = 8,
			aggregation = "SUM",
			is_sorting = true,
		},
		{
			name = "B UP",
			field = "s3.bytes.in",
			description = "Bandwidth generated by uploads of this file into its bucket.",
			colsize = 8,
			aggregation = "SUM",
		},
		{
			name = "B DOWN",
			field = "s3.bytes.out",
			description = "Bandwidth generated by downloads of this file from its bucket.",
			colsize = 8,
			aggregation = "SUM",
		},
		{
			name = "USER",
			description = "Name of the user or service.",
			field = "ct.user",
			colsize = 35,
		},
		{
			name = "IP",
			description = ".",
			field = "ct.srcip",
			colsize = 16,
		},
		{
			name = "URI",
			description = "The file URI (s3://<bucket>/<key>).",
			field = "s3.uri",
			colsize = 256,
		},
	},
}