import { Chat, ChatProps } from "./Chat";

import React from "react";
import { createRoot } from "react-dom/client";

const mount = (id: string, props: ChatProps) => {
  const container = document.getElementById(id);

  const root = createRoot(container as Element);
  root.render(
    <React.StrictMode>
      <Chat {...props} />
    </React.StrictMode>
  );

  return () => {
    root.unmount();
  };
};

export default mount;
