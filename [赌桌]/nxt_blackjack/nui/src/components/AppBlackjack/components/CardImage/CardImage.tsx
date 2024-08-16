import { useState } from "react";
import s from './CardImage.module.scss';

type Props =
{
    name: string;
}

export const CardImage : React.FC<Props> = ({name}) =>
{
    return (
        <div className={s.root}>
            <img src={`./cards/${name}.png`} alt={name} className={s.cardImage} />
        </div>
    )
}