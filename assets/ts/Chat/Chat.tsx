import React, { FC } from "react";

import ChatProps from "./Chat.types";

const Chat: FC<ChatProps> = ({ messages }) => {
  console.log({ messages });
  return <div>Chat</div>;
};

export default Chat;
