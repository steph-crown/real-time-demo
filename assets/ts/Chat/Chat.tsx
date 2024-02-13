import React, { FC } from "react";

import ChatProps from "./Chat.types";

const Chat: FC<ChatProps> = ({ messages }) => {
  return (
    <div>
      <h1>Chat Messages</h1>
      <ul>
        {messages.map((message, index) => (
          <li key={index}>{message}</li>
        ))}
      </ul>
      <form>
        <input type="text" name="message" placeholder="Type a message..." />
        <button type="submit">Add</button>
      </form>

      <footer id="footer"></footer>
    </div>
  );
};

export default Chat;
