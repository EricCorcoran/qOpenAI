\l simpleRest.q
\l config.q
\c 800 800
\d .openai

checkcreds:{$[(.config.apikey~"")|(.config.orgid~"");(exit 0;show "***** Empty OpenAI API Key or Organization ID, please set in config.q. *****");show "***** OpenAI API Key and Organization ID set *****"]}[];

paths:(!/)flip 2 cut (
    `models;"/v1/models";
    `textdavinci003;"/v1/models/text-davinci-003";
    `chatgpt;"/v1/chat/completions";
    `image;"/v1/images/generations");

auth:(!/)flip 2 cut (
    `$"Authorization";"Bearer ",.config.apikey;
    `$"OpenAI-Organization";.config.orgid;
    `$"Content-Type";.h.ty`json);

body:{[model;role;temp;content](!/)flip 2 cut (
    `model;model;
    `messages;enlist `role`content!(role;content);
    `temperature;temp)};

ibody:{[p;n;s] (!/)flip 2 cut (
    `prompt;p;
    `n;n;
    `size;s)};

/ .openai.chatgpt["gpt-3.5-turbo";"user";0.7f;"Who created kdb+?"]
/ model (string)
/ role (string)
/ temp (float)
/ content (string)
chatgpt:{[model;role;temp;content]@/[.j.k .rest.request[`POST;.config.url;paths[`chatgpt];auth;.j.j body[model;role;temp;content]];`choices`message`content]};

/ .openai.getModels[]
getModels:{@/[.j.k .rest.request[`GET;.config.url;paths[`models];auth;()];`data]};

/ .openai.createImage["a cartoon dog";3;"1024x1024"]
/ prompt (string)
/ number of images (int)
/ size of images (string)
createImage:{[prompt;n;size]@/[.j.k .rest.request[`POST;.config.url;paths[`image];auth;.j.j ibody[prompt;n;size]];`data`url]};

\d .
