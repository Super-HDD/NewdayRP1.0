import { useState } from "react";
import { CardImage } from "../CardImage/CardImage";
import s from './Participant.module.scss';

type Props =
{
    seat: number;
    cards: Array<string>;    
    cards_img: Array<string>;
    stateDescription: string;
    isTurnPlay: boolean;
}

export const Participant : React.FC<Props> = ({seat, cards, cards_img, stateDescription, isTurnPlay}) =>
{
    return (
        <div className={s.root}>            
            <div className={s.tableSeat}>
                <span>{seat}</span>
            </div>

            <div className={s.boxGame}>
                <div className={s.images}>
                    {cards_img.map(card=>{
                        return (
                            <CardImage 
                                name={card}
                            />
                        )
                    })}
                </div>
            
                <span  className={isTurnPlay ? s.turn : '' }> {stateDescription} </span>
            </div>
        </div>
    )
}