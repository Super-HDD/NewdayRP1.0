import React, {useState} from 'react';
import './App.css'
import {debugData} from "../utils/debugData";
import {fetchNui} from "../utils/fetchNui";
import { useNuiEvent } from '../hooks/useNuiEvent';

// This will set the NUI to visible if we are
// developing in browser
debugData([
  {
    action: 'setVisible',
    data: true,
  }
])

interface ReturnClientDataCompProps {
  data: any
}

const ReturnClientDataComp: React.FC<ReturnClientDataCompProps> = ({data}) => (
  <>
    <h5>Returned Data:</h5>
    <pre>
      <code>
        {JSON.stringify(data, null)}
      </code>
    </pre>
  </>
)


function submitIDcard(data:any){
  fetchNui("ndrp-license-issue-idcard",data)
}

//
function PoliceLicense(props:any){
  let buttonArea:any;

  return (
    <div className="nui-wrapper">
    <div id='main-container'>
      <div id="header-seal">
      </div>
    </div>

    {buttonArea}
  </div>
  );
}

//身份证组件
function IDcard(props:any){
  interface IDcardInfo { 
    firstName:string, 
    lastName:string,
    gender:string, 
    cid:string,
    department:string,
    address:string,
    birth:string,
    code:string,
    alreadySigned:Boolean
    blankSlot:number
  } 

  let firstNameInput:HTMLInputElement;
  let lastNameInput:HTMLInputElement;
  let genderInput:HTMLInputElement;
  let cidInput:HTMLInputElement;
  let birthInput:HTMLInputElement;
  let codeInput:HTMLInputElement;
  let addressInput:HTMLInputElement;
  let firstNameContent:any;
  let lastNameContent:any;
  let genderContent:any;
  let cidContent:any;
  let birthContent:any;
  let codeContent:any;
  let addressContent:any;
  let buttonArea:any;


  const handleSubmitIDcard = () =>{
    let data:IDcardInfo={
      firstName:firstNameInput?.value,
      lastName:lastNameInput?.value,
      gender:genderInput?.value,
      cid:cidInput?.value,
      birth:birthInput?.value,
      code:codeInput?.value,
      department:"police",
      address:addressInput.value,
      alreadySigned:true,
      blankSlot:props.blankSlot
    }

    fetchNui('ndrp-license-issue-idcard',data)
  }



  if(props.alreadySigned ==true){

    console.log("create signed idcard")
    console.log(JSON.stringify(props))
    firstNameContent=<h4>{props.firstName}</h4>
    lastNameContent=<h4>{props.lastName}</h4>
    genderContent=<h4>{props.gender}</h4>
    cidContent=<h4>{props.cid}</h4>
    addressContent=<h4>{props.address}</h4>
    birthContent=<h4>{props.birth}</h4>
    codeContent=<h4>{props.code}</h4>
    buttonArea=<></>
  }else{
    console.log("create blank idcard")
    firstNameContent=<input type="text" ref={input => firstNameInput= input!}/>
    lastNameContent=<input type="text" ref={input => lastNameInput=input!}/>
    genderContent=<input type="text" ref={input => genderInput=input!}/>
    cidContent=<input type="text" ref={input=>cidInput=input!}/>
    addressContent=<input type="text" ref={input=>addressInput=input!}/>
    birthContent=<input type="text" placeholder='mm/dd/yyyy' ref={input=>birthInput=input!}/>
    codeContent=<input type="text" ref={input=>codeInput=input!}/>
    buttonArea=(<div className="button-area">
                      <button id="button_submit" type="button" onClick={handleSubmitIDcard}>确认签署</button>
                </div>);
  }




  return (
    <div className="nui-wrapper">
    <div id='main-container'>
      <div id="header-seal">
          {/* <h3>签发部门</h3> */}
      </div>
      <div className="info_subblock">
        <table>
          <tr>
            <td>
              <h3>名字</h3>
            </td>
            <td>
              {firstNameContent}
            </td>
          </tr>
          <tr>
            <td>
              <h3>姓氏</h3>
            </td>
            <td>
              {lastNameContent}
            </td>
          </tr>
          <tr>
            <td>
              <h3>性别</h3>
            </td>
            <td>
              {genderContent}
            </td>
          </tr>
          <tr>
            <td>
              <h3>生日</h3>
            </td>
            <td>
              {birthContent}
            </td>
          </tr>
          <tr>
            <td>
              <h3>居住地</h3>
            </td>
            <td>
              {addressContent}
            </td>
          </tr>
          <tr>
            <td>
              <h3>邮编</h3>
            </td>
            <td>
              {cidContent}
            </td>
          </tr>
          <tr>
            <td>
              <h3>防伪识别码</h3>
            </td>
            <td>
              {codeContent}
            </td>
          </tr>
        </table>
      </div>
    </div>

    {buttonArea}
  </div>
  );
}

const App: React.FC = () => {
  const [content, setContent] = useState(<></>);

  useNuiEvent('displayIDcard',(info)=>{
    console.log(info)
    console.debug(info)
    setContent(<>{IDcard(info)}</>);
    console.debug(content);
    
  })

  

  return (
    <>
      {content}
    </>
  );
   
}

export default App;
