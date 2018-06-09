<?php
namespace app\models;

use yii\base\Model;
use app\models\User;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $password;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\app\models\User'],
            ['username', 'string', 'min' => 2, 'max' => 255],

            ['password', 'required'],
            ['password', 'string', 'min' => 6],
        ];
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    //public function signup()
    //{
    //    if (!$this->validate()) {
    //        return null;
    //    }
    //    
    //    $user = new User();
    //    $user->username = $this->username;
    //    $user->setPassword($this->password);
    //    $user->generateAuthKey();
    //    
    //    return $user->save() ? $user : null;
    //}
    public function signup()
{
    if ($this->validate()) {
        $user = new User();
        $user->username = $this->username;
        $user->setPassword($this->password);
        $user->generateAuthKey();
        $user->save(false);

        // the following three lines were added:
        //$auth = \Yii::$app->authManager;
        //$authorRole = $auth->getRole('author');
        //$auth->assign($authorRole, $user->getId());

        return $user;
    }

    return null;
}
}
