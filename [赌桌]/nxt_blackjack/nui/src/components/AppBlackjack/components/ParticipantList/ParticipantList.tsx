import { useState } from "react";
import { Participant } from "../Participant/Participant";
import s from './ParticipantList.module.scss';

export type ParticipantData = {
    seat: number;
    cards: Array<string>;
    cards_img: Array<string>;
    stateDescription: string;
    isTurnPlay: boolean;
}

type Props =
{
    participantList: Array<ParticipantData>;    
}

export const ParticipantList : React.FC<Props> = ({participantList}) =>
{
    return (
        <div className={s.root}>
            {participantList.map(participant=>{
                return (
                    <Participant
                        seat = {participant.seat}
                        cards = {participant.cards}
                        cards_img = {participant.cards_img}
                        stateDescription = {participant.stateDescription}
                        isTurnPlay = {participant.isTurnPlay}
                    />
                )
            })}
        </div>
    )
}