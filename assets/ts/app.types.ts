import { ChatProps } from "./Chat";

export interface CustomHooks {
  Chat: {
    mounted(): void;
    destroyed(): void;
    getProps(): ChatProps;
  };
}
