# qOpenAI

q/kdb+ library to interact with OpenAI API

Get list of available models
```
q).openai.getModels[]
id                             object  created      owned_by          permission                                                                                                                     ..
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------..
"whisper-1"                    "model" 1.677532e+09 "openai-internal" +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organiz..
"babbage"                      "model" 1.649358e+09 "openai"          +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organiz..
"text-davinci-003"             "model" 1.6696e+09   "openai-internal" +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organiz..
"davinci"                      "model" 1.64936e+09  "openai"          +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organiz..
"text-davinci-edit-001"        "model" 1.649809e+09 "openai"          +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organiz..
"babbage-code-search-code"     "model" 1.651173e+09 "openai-dev"      +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organiz..
"text-similarity-babbage-001"  "model" 1.651173e+09 "openai-dev"      +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organiz..
"code-davinci-edit-001"        "model" 1.64988e+09  "openai"          +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organiz..
"text-davinci-001"             "model" 1.649364e+09 "openai"          +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organiz..
"ada"                          "model" 1.649357e+09 "openai"          +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organiz..
"babbage-code-search-text"     "model" 1.651173e+09 "openai-dev"      +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organiz..
```
Get list of GPT models
```
q)?[.openai.getModels[];enlist (like;`id;"gpt*");0b;()]
id                       object  created      owned_by          permission                                                                                                                           ..
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------..
"gpt-3.5-turbo-0613"     "model" 1.686587e+09 "openai"          +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organization`..
"gpt-3.5-turbo-0301"     "model" 1.67765e+09  "openai"          +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organization`..
"gpt-3.5-turbo"          "model" 1.677611e+09 "openai"          +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organization`..
"gpt-3.5-turbo-16k-0613" "model" 1.685474e+09 "openai"          +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organization`..
"gpt-3.5-turbo-16k"      "model" 1.683758e+09 "openai-internal" +`id`object`created`allow_create_engine`allow_sampling`allow_logprobs`allow_search_indices`allow_view`allow_fine_tuning`organization`..
```

Send prompt to Chatgpt
```
q).openai.chatgpt["gpt-3.5-turbo";"user";0.7f;"Who created kdb+?"]
"kdb+ was created by Arthur Whitney, a computer programmer and the founder of Kx Systems."
```
Create Images
```
q).openai.createImage["a cartoon dog";3;"1024x1024"]
```
